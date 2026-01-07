import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:stackoverflow_users_reputation/modules/users/domain/entities/badge_counts_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/usecases/user_usecases.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_state.dart';

import 'user_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetUsersUseCase>(),
  MockSpec<BookmarkUserUseCase>(),
  MockSpec<RemoveBookmarkUseCase>(),
  MockSpec<GetBookmarkedUsersUseCase>(),
])
void main() {
  group('UserBloc Tests', () {
    late MockGetUsersUseCase mockGetUsersUseCase;
    late MockBookmarkUserUseCase mockBookmarkUserUseCase;
    late MockRemoveBookmarkUseCase mockRemoveBookmarkUseCase;
    late MockGetBookmarkedUsersUseCase mockGetBookmarkedUsersUseCase;
    late UserBloc userBloc;

    // Sample data
    final sampleUsers = [
      UserEntity(
        userId: 1,
        displayName: 'John Doe',
        profileImage: 'https://example.com/john.jpg',
        reputation: 5000,
        badgeCounts: const BadgeCountsEntity(
          bronze: 10,
          silver: 5,
          gold: 2,
        ),
        location: 'New York',
        websiteUrl: 'https://johndoe.com',
        isBookmarked: false,
      ),
      UserEntity(
        userId: 2,
        displayName: 'Jane Smith',
        profileImage: 'https://example.com/jane.jpg',
        reputation: 7500,
        badgeCounts: const BadgeCountsEntity(
          bronze: 15,
          silver: 10,
          gold: 5,
        ),
        location: 'San Francisco',
        websiteUrl: 'https://janesmith.com',
        isBookmarked: false,
      ),
    ];

    setUp(() {
      mockGetUsersUseCase = MockGetUsersUseCase();
      mockBookmarkUserUseCase = MockBookmarkUserUseCase();
      mockRemoveBookmarkUseCase = MockRemoveBookmarkUseCase();
      mockGetBookmarkedUsersUseCase = MockGetBookmarkedUsersUseCase();

      userBloc = UserBloc(
        getUsersUseCase: mockGetUsersUseCase,
        bookmarkUserUseCase: mockBookmarkUserUseCase,
        removeBookmarkUseCase: mockRemoveBookmarkUseCase,
        getBookmarkedUsersUseCase: mockGetBookmarkedUsersUseCase,
      );
    });

    tearDown(() {
      userBloc.close();
    });

    group('FetchNextPage Event', () {
      test('initial state is UserState with empty paging state', () {
        expect(userBloc.state, isA<UserState>());
        expect(userBloc.state.showOnlyBookmarked, false);
      });

      blocTest<UserBloc, UserState>(
        'emits [loading, success] when fetching users succeeds',
        setUp: () {
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenAnswer((_) async => sampleUsers);
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.fetchNextPage(pageKey: 1, pageSize: 30)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true)
              .having((state) => state.error, 'error', null),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.hasNextPage, 'hasNextPage', true)
              .having((state) => state.pages?.length, 'pages length', 1)
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', false),
        ],
        verify: (_) {
          verify(mockGetUsersUseCase.call(page: 1, pageSize: 30)).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits [loading, success] with multiple pages',
        setUp: () {
          final firstPageUsers = sampleUsers;
          final secondPageUsers = [
            UserEntity(
              userId: 3,
              displayName: 'Bob Johnson',
              profileImage: 'https://example.com/bob.jpg',
              reputation: 3000,
              isBookmarked: false,
            ),
          ];

          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenAnswer((_) async => firstPageUsers);
          when(
            mockGetUsersUseCase.call(page: 2, pageSize: 30),
          ).thenAnswer((_) async => secondPageUsers);
        },
        build: () => userBloc,
        act: (bloc) {
          bloc.add(const UserEvent.fetchNextPage(pageKey: 1, pageSize: 30));
          // Wait for first page to complete before adding second page
          Future.delayed(const Duration(milliseconds: 100)).then(
            (_) => bloc.add(const UserEvent.fetchNextPage(pageKey: 2, pageSize: 30)),
          );
        },
        wait: const Duration(milliseconds: 200),
        verify: (_) {
          verify(mockGetUsersUseCase.call(page: 1, pageSize: 30)).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits [loading, error] when fetching users fails',
        setUp: () {
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenThrow(Exception('Network error'));
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.fetchNextPage(pageKey: 1, pageSize: 30)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true)
              .having((state) => state.error, 'error', null),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.error, 'error', isA<Exception>()),
        ],
      );
    });

    group('ToggleBookmark Event', () {
      blocTest<UserBloc, UserState>(
        'bookmarks a user when not bookmarked',
        setUp: () {
          when(mockBookmarkUserUseCase.call(sampleUsers[0])).thenAnswer((_) async {});
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenAnswer((_) async => sampleUsers);
        },
        build: () => userBloc,
        seed: () => UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [sampleUsers],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
        act: (bloc) => bloc.add(UserEvent.toggleBookmark(sampleUsers[0])),
        expect: () => [
          isA<UserState>()
              .having(
                (state) => state.pages?[0].first.isBookmarked,
                'isBookmarked',
                true,
              ),
        ],
        verify: (_) {
          verify(mockBookmarkUserUseCase.call(sampleUsers[0])).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'removes bookmark when user is bookmarked',
        setUp: () {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          when(mockRemoveBookmarkUseCase.call(bookmarkedUser.userId))
              .thenAnswer((_) async {});
        },
        build: () => userBloc,
        seed: () {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          return UserState(
            pagingState: PagingState<int, UserEntity>(
              pages: [[bookmarkedUser, sampleUsers[1]]],
              keys: [1],
              hasNextPage: false,
              isLoading: false,
            ),
            showOnlyBookmarked: false,
          );
        },
        act: (bloc) {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          bloc.add(UserEvent.toggleBookmark(bookmarkedUser));
        },
        expect: () => [
          isA<UserState>()
              .having(
                (state) => state.pages?[0].first.isBookmarked,
                'isBookmarked',
                false,
              ),
        ],
        verify: (_) {
          verify(mockRemoveBookmarkUseCase.call(sampleUsers[0].userId)).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'reloads bookmarked users when removing bookmark while filtering',
        setUp: () {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          when(mockRemoveBookmarkUseCase.call(bookmarkedUser.userId))
              .thenAnswer((_) async {});
          when(mockGetBookmarkedUsersUseCase.call()).thenAnswer(
            (_) async => [sampleUsers[1]],
          );
        },
        build: () => userBloc,
        seed: () {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          return UserState(
            pagingState: PagingState<int, UserEntity>(
              pages: [[bookmarkedUser]],
              keys: [1],
              hasNextPage: false,
              isLoading: false,
            ),
            showOnlyBookmarked: true,
          );
        },
        act: (bloc) {
          final bookmarkedUser = sampleUsers[0].copyWith(isBookmarked: true);
          bloc.add(UserEvent.toggleBookmark(bookmarkedUser));
        },
        expect: () => [
          isA<UserState>()
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', true)
              .having((state) => state.pages?.length, 'pages length', 1),
        ],
        verify: (_) {
          verify(mockRemoveBookmarkUseCase.call(sampleUsers[0].userId)).called(1);
          verify(mockGetBookmarkedUsersUseCase.call()).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits error when toggling bookmark fails',
        setUp: () {
          when(mockBookmarkUserUseCase.call(sampleUsers[0])).thenThrow(
            Exception('Bookmark failed'),
          );
        },
        build: () => userBloc,
        seed: () => UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [sampleUsers],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
        act: (bloc) => bloc.add(UserEvent.toggleBookmark(sampleUsers[0])),
        expect: () => [
          isA<UserState>()
              .having((state) => state.error, 'error', isA<Exception>()),
        ],
      );
    });

    group('FilterByBookmark Event', () {
      blocTest<UserBloc, UserState>(
        'loads bookmarked users when filter is enabled',
        setUp: () {
          final bookmarkedUsers = [
            sampleUsers[0].copyWith(isBookmarked: true),
          ];
          when(mockGetBookmarkedUsersUseCase.call())
              .thenAnswer((_) async => bookmarkedUsers);
        },
        build: () => userBloc,
        seed: () => UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [sampleUsers],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
        act: (bloc) => bloc.add(const UserEvent.filterByBookmark(showOnlyBookmarked: true)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', true)
              .having((state) => state.pages?.length, 'pages length', 1),
        ],
        verify: (_) {
          verify(mockGetBookmarkedUsersUseCase.call()).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'refreshes users when filter is disabled',
        setUp: () {
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenAnswer((_) async => sampleUsers);
        },
        build: () => userBloc,
        seed: () => UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [
              [sampleUsers[0].copyWith(isBookmarked: true)],
            ],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: true,
        ),
        act: (bloc) => bloc.add(const UserEvent.filterByBookmark(showOnlyBookmarked: false)),
        wait: const Duration(milliseconds: 100),
        verify: (_) {
          verify(mockGetUsersUseCase.call(page: 1, pageSize: 30)).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits error when loading bookmarked users fails',
        setUp: () {
          when(mockGetBookmarkedUsersUseCase.call())
              .thenThrow(Exception('Load bookmarks failed'));
        },
        build: () => userBloc,
        seed: () => UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [sampleUsers],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
        act: (bloc) => bloc.add(const UserEvent.filterByBookmark(showOnlyBookmarked: true)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.error, 'error', isA<Exception>()),
        ],
      );
    });

    group('RefreshUsers Event', () {
      blocTest<UserBloc, UserState>(
        'refreshes user list successfully',
        setUp: () {
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenAnswer((_) async => sampleUsers);
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.refreshUsers(pageSize: 30)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true)
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', false),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.pages?.length, 'pages length', 1),
        ],
        verify: (_) {
          verify(mockGetUsersUseCase.call(page: 1, pageSize: 30)).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits error when refresh fails',
        setUp: () {
          when(
            mockGetUsersUseCase.call(page: 1, pageSize: 30),
          ).thenThrow(Exception('Refresh failed'));
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.refreshUsers(pageSize: 30)),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.error, 'error', isA<Exception>()),
        ],
      );
    });

    group('LoadBookmarkedUsers Event', () {
      blocTest<UserBloc, UserState>(
        'loads bookmarked users successfully',
        setUp: () {
          final bookmarkedUsers = [
            sampleUsers[0].copyWith(isBookmarked: true),
            sampleUsers[1].copyWith(isBookmarked: true),
          ];
          when(mockGetBookmarkedUsersUseCase.call())
              .thenAnswer((_) async => bookmarkedUsers);
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.loadBookmarkedUsers()),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true)
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', true),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.showOnlyBookmarked, 'showOnlyBookmarked', true)
              .having((state) => state.pages?.length, 'pages length', 1)
              .having((state) => state.hasNextPage, 'hasNextPage', false),
        ],
        verify: (_) {
          verify(mockGetBookmarkedUsersUseCase.call()).called(1);
        },
      );

      blocTest<UserBloc, UserState>(
        'emits error when loading bookmarked users fails',
        setUp: () {
          when(mockGetBookmarkedUsersUseCase.call())
              .thenThrow(Exception('Load bookmarks failed'));
        },
        build: () => userBloc,
        act: (bloc) => bloc.add(const UserEvent.loadBookmarkedUsers()),
        expect: () => [
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', true),
          isA<UserState>()
              .having((state) => state.isLoading, 'isLoading', false)
              .having((state) => state.error, 'error', isA<Exception>()),
        ],
      );
    });
  });
}
