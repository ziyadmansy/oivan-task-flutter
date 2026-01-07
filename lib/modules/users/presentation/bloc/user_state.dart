import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/user_entity.dart';

/// Wrapper around PagingState to add custom properties
class UserState {
  final PagingState<int, UserEntity> pagingState;
  final bool showOnlyBookmarked;

  UserState({
    PagingState<int, UserEntity>? pagingState,
    this.showOnlyBookmarked = false,
  }) : pagingState = pagingState ?? PagingState<int, UserEntity>();

  factory UserState.initial() => UserState();

  // Delegate PagingState properties
  List<List<UserEntity>>? get pages => pagingState.pages;
  List<int>? get keys => pagingState.keys;
  bool get hasNextPage => pagingState.hasNextPage;
  bool get isLoading => pagingState.isLoading;
  dynamic get error => pagingState.error;

  UserState copyWith({
    List<List<UserEntity>>? pages,
    List<int>? keys,
    bool? hasNextPage,
    bool? isLoading,
    dynamic error,
    bool? showOnlyBookmarked,
  }) {
    return UserState(
      pagingState: PagingState<int, UserEntity>(
        pages: pages ?? this.pages,
        keys: keys ?? this.keys,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      ),
      showOnlyBookmarked: showOnlyBookmarked ?? this.showOnlyBookmarked,
    );
  }

  UserState reset() {
    return UserState(showOnlyBookmarked: showOnlyBookmarked);
  }
}
