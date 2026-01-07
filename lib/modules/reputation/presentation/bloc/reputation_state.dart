import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/reputation_history_entity.dart';

/// Wrapper around PagingState for reputation history
class ReputationState {
  final PagingState<int, ReputationHistoryEntity> pagingState;

  ReputationState({PagingState<int, ReputationHistoryEntity>? pagingState})
    : pagingState = pagingState ?? PagingState<int, ReputationHistoryEntity>();

  factory ReputationState.initial() => ReputationState();

  // Delegate PagingState properties
  List<List<ReputationHistoryEntity>>? get pages => pagingState.pages;
  List<int>? get keys => pagingState.keys;
  bool get hasNextPage => pagingState.hasNextPage;
  bool get isLoading => pagingState.isLoading;
  dynamic get error => pagingState.error;

  ReputationState copyWith({
    List<List<ReputationHistoryEntity>>? pages,
    List<int>? keys,
    bool? hasNextPage,
    bool? isLoading,
    dynamic error,
  }) {
    return ReputationState(
      pagingState: PagingState<int, ReputationHistoryEntity>(
        pages: pages ?? this.pages,
        keys: keys ?? this.keys,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      ),
    );
  }

  ReputationState reset() {
    return ReputationState();
  }
}
