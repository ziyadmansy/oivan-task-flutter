import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/user_usecases.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  final BookmarkUserUseCase bookmarkUserUseCase;
  final RemoveBookmarkUseCase removeBookmarkUseCase;
  final GetBookmarkedUsersUseCase getBookmarkedUsersUseCase;

  UserBloc({
    required this.getUsersUseCase,
    required this.bookmarkUserUseCase,
    required this.removeBookmarkUseCase,
    required this.getBookmarkedUsersUseCase,
  }) : super(UserState()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        fetchNextPage:
            (pageKey, pageSize) => _onFetchNextPage(pageKey, pageSize, emit),
        loadBookmarkedUsers: () => _onLoadBookmarkedUsers(emit),
        toggleBookmark: (user) => _onToggleBookmark(user, emit),
        filterByBookmark:
            (showOnlyBookmarked) =>
                _onFilterByBookmark(showOnlyBookmarked, emit),
        refreshUsers: (pageSize) => _onRefreshUsers(pageSize, emit),
      );
    });
  }

  Future<void> _onFetchNextPage(
    int pageKey,
    int pageSize,
    Emitter<UserState> emit,
  ) async {
    final currentState = state;
    if (currentState.isLoading) return;

    emit(
      currentState.copyWith(
        isLoading: true,
        error: null,
        showOnlyBookmarked: false,
      ),
    );

    try {
      final newItems = await getUsersUseCase(page: pageKey, pageSize: pageSize);
      final isLastPage = newItems.isEmpty;

      emit(
        currentState.copyWith(
          pages: [...?currentState.pages, newItems],
          keys: [...?currentState.keys, pageKey],
          hasNextPage: !isLastPage,
          isLoading: false,
          showOnlyBookmarked: false,
        ),
      );
    } catch (error) {
      emit(
        currentState.copyWith(
          error: error,
          isLoading: false,
          showOnlyBookmarked: false,
        ),
      );
    }
  }

  Future<void> _onRefreshUsers(int pageSize, Emitter<UserState> emit) async {
    emit(
      UserState(
        pagingState: PagingState<int, UserEntity>(isLoading: true),
        showOnlyBookmarked: false,
      ),
    );

    try {
      final users = await getUsersUseCase(page: 1, pageSize: pageSize);
      final isLastPage = users.isEmpty;

      emit(
        UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [users],
            keys: [1],
            hasNextPage: !isLastPage,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
      );
    } catch (error) {
      emit(
        UserState(
          pagingState: PagingState<int, UserEntity>(
            error: error,
            isLoading: false,
          ),
          showOnlyBookmarked: false,
        ),
      );
    }
  }

  Future<void> _onLoadBookmarkedUsers(Emitter<UserState> emit) async {
    emit(
      UserState(
        pagingState: PagingState<int, UserEntity>(isLoading: true),
        showOnlyBookmarked: true,
      ),
    );
    try {
      final users = await getBookmarkedUsersUseCase();
      emit(
        UserState(
          pagingState: PagingState<int, UserEntity>(
            pages: [users],
            keys: [1],
            hasNextPage: false,
            isLoading: false,
          ),
          showOnlyBookmarked: true,
        ),
      );
    } catch (e) {
      emit(
        UserState(
          pagingState: PagingState<int, UserEntity>(error: e, isLoading: false),
          showOnlyBookmarked: true,
        ),
      );
    }
  }

  Future<void> _onToggleBookmark(
    UserEntity user,
    Emitter<UserState> emit,
  ) async {
    try {
      if (user.isBookmarked) {
        await removeBookmarkUseCase(user.userId);
      } else {
        await bookmarkUserUseCase(user);
      }

      final currentState = state;

      // If we're viewing bookmarks and just removed a bookmark, reload bookmarks
      if (currentState.showOnlyBookmarked && user.isBookmarked) {
        final bookmarkedUsers = await getBookmarkedUsersUseCase();
        emit(
          UserState(
            pagingState: PagingState<int, UserEntity>(
              pages: [bookmarkedUsers],
              keys: [1],
              hasNextPage: false,
              isLoading: false,
            ),
            showOnlyBookmarked: true,
          ),
        );
      } else {
        // Otherwise, just update the local state
        final updatedPages =
            currentState.pages?.map((page) {
              return page.map((u) {
                if (u.userId == user.userId) {
                  return u.copyWith(isBookmarked: !u.isBookmarked);
                }
                return u;
              }).toList();
            }).toList();

        emit(currentState.copyWith(pages: updatedPages));
      }
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _onFilterByBookmark(
    bool showOnlyBookmarked,
    Emitter<UserState> emit,
  ) async {
    try {
      if (showOnlyBookmarked) {
        final bookmarkedUsers = await getBookmarkedUsersUseCase();
        emit(
          UserState(
            pagingState: PagingState<int, UserEntity>(
              pages: [bookmarkedUsers],
              keys: [1],
              hasNextPage: false,
              isLoading: false,
            ),
            showOnlyBookmarked: true,
          ),
        );
      } else {
        add(const UserEvent.refreshUsers());
      }
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }
}
