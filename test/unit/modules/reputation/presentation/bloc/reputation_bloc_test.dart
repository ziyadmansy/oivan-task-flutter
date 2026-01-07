import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:stackoverflow_users_reputation/modules/reputation/domain/entities/reputation_history_entity.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/domain/enums/reputation_history_type.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/domain/usecases/reputation_usecases.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/presentation/bloc/reputation_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/presentation/bloc/reputation_event.dart';
import 'package:stackoverflow_users_reputation/modules/reputation/presentation/bloc/reputation_state.dart';

import 'reputation_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetReputationHistoryUseCase>()])
void main() {
  group('ReputationBloc Tests', () {
    late MockGetReputationHistoryUseCase mockGetReputationHistoryUseCase;
    late ReputationBloc reputationBloc;

    // Sample data
    final sampleReputationHistory = <ReputationHistoryEntity>[
      ReputationHistoryEntity(
        reputationHistoryType: ReputationHistoryType.postUpvoted,
        userId: 123,
        reputationChange: 100,
        createdAt: DateTime(2024, 1, 1),
        postId: 1,
      ),
      ReputationHistoryEntity(
        reputationHistoryType: ReputationHistoryType.answerAccepted,
        userId: 123,
        reputationChange: 50,
        createdAt: DateTime(2024, 1, 2),
        postId: 2,
      ),
      ReputationHistoryEntity(
        reputationHistoryType: ReputationHistoryType.voterDownvotes,
        userId: 123,
        reputationChange: -5,
        createdAt: DateTime(2024, 1, 3),
        postId: 3,
      ),
    ];

    setUp(() {
      mockGetReputationHistoryUseCase = MockGetReputationHistoryUseCase();
      reputationBloc = ReputationBloc(
        getReputationHistoryUseCase: mockGetReputationHistoryUseCase,
      );
    });

    tearDown(() {
      reputationBloc.close();
    });

    group('Initial State', () {
      test('initial state is ReputationState with initial values', () {
        expect(reputationBloc.state, isA<ReputationState>());
        expect(reputationBloc.state.isLoading, false);
        expect(reputationBloc.state.error, null);
        expect(reputationBloc.state.pages, null);
      });
    });

    group('FetchNextPage Event', () {
      const userId = 123;
      const pageKey = 1;
      const pageSize = 20;

      blocTest<ReputationBloc, ReputationState>(
        'emits [loading, success] when fetching reputation history succeeds',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => sampleReputationHistory);
        },
        build: () => reputationBloc,
        act:
            (bloc) => bloc.add(
              const ReputationEvent.fetchNextPage(
                userId: userId,
                pageKey: pageKey,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', true)
                  .having((state) => state.error, 'error', null),
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', false)
                  .having((state) => state.hasNextPage, 'hasNextPage', true)
                  .having((state) => state.pages?.length, 'pages length', 1),
            ],
        verify: (_) {
          verify(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          ).called(1);
        },
      );

      blocTest<ReputationBloc, ReputationState>(
        'emits [loading, success] for multiple pages',
        setUp: () {
          final firstPage = sampleReputationHistory.take(2).toList();
          final secondPage = sampleReputationHistory.skip(2).toList();

          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => firstPage);

          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 2,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => secondPage);
        },
        build: () => reputationBloc,
        act: (bloc) async {
          bloc.add(
            const ReputationEvent.fetchNextPage(
              userId: userId,
              pageKey: 1,
              pageSize: pageSize,
            ),
          );
          await Future.delayed(const Duration(milliseconds: 100));
          bloc.add(
            const ReputationEvent.fetchNextPage(
              userId: userId,
              pageKey: 2,
              pageSize: pageSize,
            ),
          );
        },
        wait: const Duration(milliseconds: 200),
        verify: (_) {
          verify(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).called(1);
        },
      );

      blocTest<ReputationBloc, ReputationState>(
        'emits [loading, error] when fetching fails',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          ).thenThrow(Exception('Network error'));
        },
        build: () => reputationBloc,
        act:
            (bloc) => bloc.add(
              const ReputationEvent.fetchNextPage(
                userId: userId,
                pageKey: pageKey,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', true)
                  .having((state) => state.error, 'error', null),
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', false)
                  .having((state) => state.error, 'error', isA<Exception>()),
            ],
      );

      blocTest<ReputationBloc, ReputationState>(
        'determines last page correctly when data is empty',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => []);
        },
        build: () => reputationBloc,
        act:
            (bloc) => bloc.add(
              const ReputationEvent.fetchNextPage(
                userId: userId,
                pageKey: pageKey,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>().having(
                (state) => state.isLoading,
                'isLoading',
                true,
              ),
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', false)
                  .having((state) => state.hasNextPage, 'hasNextPage', false)
                  .having((state) => state.pages?.length, 'pages length', 1)
                  .having(
                    (state) => state.pages?[0].length,
                    'first page length',
                    0,
                  ),
            ],
      );
    });

    group('RefreshReputationHistory Event', () {
      const userId = 123;
      const pageSize = 20;

      blocTest<ReputationBloc, ReputationState>(
        'refreshes reputation history successfully',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => sampleReputationHistory);
        },
        build: () => reputationBloc,
        act:
            (bloc) => bloc.add(
              const ReputationEvent.refreshReputationHistory(
                userId: userId,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', true)
                  .having((state) => state.pages, 'pages', null),
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', false)
                  .having((state) => state.pages?.length, 'pages length', 1)
                  .having(
                    (state) => state.pages?[0].length,
                    'first page length',
                    sampleReputationHistory.length,
                  ),
            ],
        verify: (_) {
          verify(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).called(1);
        },
      );

      blocTest<ReputationBloc, ReputationState>(
        'resets to first page on refresh',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => sampleReputationHistory);
        },
        build: () => reputationBloc,
        seed:
            () => ReputationState(
              pagingState: PagingState<int, ReputationHistoryEntity>(
                pages: [
                  [sampleReputationHistory[0]],
                  [sampleReputationHistory[1]],
                ],
                keys: [1, 2],
                hasNextPage: true,
                isLoading: false,
              ),
            ),
        act:
            (bloc) => bloc.add(
              const ReputationEvent.refreshReputationHistory(
                userId: userId,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>().having(
                (state) => state.isLoading,
                'isLoading',
                true,
              ),
              isA<ReputationState>()
                  .having((state) => state.pages?.length, 'pages length', 1)
                  .having((state) => state.keys?.length, 'keys length', 1),
            ],
      );

      blocTest<ReputationBloc, ReputationState>(
        'emits error when refresh fails',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 1,
              pageSize: pageSize,
            ),
          ).thenThrow(Exception('Refresh failed'));
        },
        build: () => reputationBloc,
        act:
            (bloc) => bloc.add(
              const ReputationEvent.refreshReputationHistory(
                userId: userId,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>().having(
                (state) => state.isLoading,
                'isLoading',
                true,
              ),
              isA<ReputationState>()
                  .having((state) => state.isLoading, 'isLoading', false)
                  .having((state) => state.error, 'error', isA<Exception>()),
            ],
      );
    });

    group('Edge Cases', () {
      const userId = 123;
      const pageKey = 1;
      const pageSize = 20;

      blocTest<ReputationBloc, ReputationState>(
        'does not fetch if already loading',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => sampleReputationHistory);
        },
        build: () => reputationBloc,
        seed:
            () => ReputationState(
              pagingState: PagingState<int, ReputationHistoryEntity>(
                isLoading: true,
              ),
            ),
        act:
            (bloc) => bloc.add(
              const ReputationEvent.fetchNextPage(
                userId: userId,
                pageKey: pageKey,
                pageSize: pageSize,
              ),
            ),
        expect: () => [],
        verify: (_) {
          verifyNever(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: pageKey,
              pageSize: pageSize,
            ),
          );
        },
      );

      blocTest<ReputationBloc, ReputationState>(
        'appends new page to existing pages',
        setUp: () {
          when(
            mockGetReputationHistoryUseCase.call(
              userId: userId,
              page: 2,
              pageSize: pageSize,
            ),
          ).thenAnswer((_) async => [sampleReputationHistory[0]]);
        },
        build: () => reputationBloc,
        seed:
            () => ReputationState(
              pagingState: PagingState<int, ReputationHistoryEntity>(
                pages: [sampleReputationHistory],
                keys: [1],
                hasNextPage: true,
                isLoading: false,
              ),
            ),
        act:
            (bloc) => bloc.add(
              const ReputationEvent.fetchNextPage(
                userId: userId,
                pageKey: 2,
                pageSize: pageSize,
              ),
            ),
        expect:
            () => [
              isA<ReputationState>().having(
                (state) => state.isLoading,
                'isLoading',
                true,
              ),
              isA<ReputationState>()
                  .having((state) => state.pages?.length, 'pages length', 2)
                  .having((state) => state.keys?.length, 'keys length', 2),
            ],
      );
    });
  });
}
