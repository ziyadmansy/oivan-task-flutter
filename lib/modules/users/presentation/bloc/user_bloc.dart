import 'package:flutter_bloc/flutter_bloc.dart';

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
  }) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        loadUsers: (page, pageSize) => _onLoadUsers(page, pageSize, emit),
        loadBookmarkedUsers: () => _onLoadBookmarkedUsers(emit),
        toggleBookmark: (user) => _onToggleBookmark(user, emit),
        filterByBookmark:
            (showOnlyBookmarked) =>
                _onFilterByBookmark(showOnlyBookmarked, emit),
      );
    });
  }

  Future<void> _onLoadUsers(
    int page,
    int pageSize,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      final users = await getUsersUseCase(page: page, pageSize: pageSize);
      emit(UserState.loaded(users: users));
    } catch (e) {
      emit(UserState.error('Failed to load users: ${e.toString()}'));
    }
  }

  Future<void> _onLoadBookmarkedUsers(Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      final users = await getBookmarkedUsersUseCase();
      emit(UserState.loaded(users: users, showOnlyBookmarked: true));
    } catch (e) {
      emit(UserState.error('Failed to load bookmarked users: ${e.toString()}'));
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
      currentState.mapOrNull(
        loaded: (loadedState) {
          final updatedUsers =
              loadedState.users.map((u) {
                if (u.userId == user.userId) {
                  return u.copyWith(isBookmarked: !u.isBookmarked);
                }
                return u;
              }).toList();

          emit(
            UserState.loaded(
              users: updatedUsers,
              showOnlyBookmarked: loadedState.showOnlyBookmarked,
            ),
          );
        },
      );
    } catch (e) {
      emit(UserState.error('Failed to toggle bookmark: ${e.toString()}'));
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
          UserState.loaded(users: bookmarkedUsers, showOnlyBookmarked: true),
        );
      } else {
        add(const UserEvent.loadUsers());
      }
    } catch (e) {
      emit(UserState.error('Failed to filter users: ${e.toString()}'));
    }
  }
}
