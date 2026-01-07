import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/reputation_history_entity.dart';
import '../../domain/usecases/reputation_usecases.dart';
import 'reputation_event.dart';
import 'reputation_state.dart';

class ReputationBloc extends Bloc<ReputationEvent, ReputationState> {
  final GetReputationHistoryUseCase getReputationHistoryUseCase;

  ReputationBloc({required this.getReputationHistoryUseCase})
    : super(ReputationState.initial()) {
    on<ReputationEvent>((event, emit) async {
      await event.when(
        fetchNextPage:
            (userId, pageKey, pageSize) =>
                _onFetchNextPage(userId, pageKey, pageSize, emit),
        refreshReputationHistory:
            (userId, pageSize) =>
                _onRefreshReputationHistory(userId, pageSize, emit),
      );
    });
  }

  Future<void> _onFetchNextPage(
    int userId,
    int pageKey,
    int pageSize,
    Emitter<ReputationState> emit,
  ) async {
    final currentState = state;
    if (currentState.isLoading) return;

    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      final newItems = await getReputationHistoryUseCase(
        userId: userId,
        page: pageKey,
        pageSize: pageSize,
      );
      final isLastPage = newItems.isEmpty;

      emit(
        currentState.copyWith(
          pages: [...?currentState.pages, newItems],
          keys: [...?currentState.keys, pageKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(currentState.copyWith(error: error, isLoading: false));
    }
  }

  Future<void> _onRefreshReputationHistory(
    int userId,
    int pageSize,
    Emitter<ReputationState> emit,
  ) async {
    emit(
      ReputationState(
        pagingState: PagingState<int, ReputationHistoryEntity>(isLoading: true),
      ),
    );

    try {
      final reputations = await getReputationHistoryUseCase(
        userId: userId,
        page: 1,
        pageSize: pageSize,
      );
      final isLastPage = reputations.isEmpty;

      emit(
        ReputationState(
          pagingState: PagingState<int, ReputationHistoryEntity>(
            pages: [reputations],
            keys: [1],
            hasNextPage: !isLastPage,
            isLoading: false,
          ),
        ),
      );
    } catch (error) {
      emit(
        ReputationState(
          pagingState: PagingState<int, ReputationHistoryEntity>(
            error: error,
            isLoading: false,
          ),
        ),
      );
    }
  }
}
