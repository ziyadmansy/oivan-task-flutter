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
    on<UserEvent>((event, emit) {
      event.when(
        loadUsers: _onLoadUsers,
        loadBookmarkedUsers: _onLoadBookmarkedUsers,
        toggleBookmark: _onToggleBookmark,
        filterByBookmark: _onFilterByBookmark,
      );
    });
  }

  Future<void> _onLoadUsers(int page, int pageSize) async {
    emit(const UserState.loading());
    try {
      final users = await getUsersUseCase(page: page, pageSize: pageSize);
      emit(UserState.loaded(users: users));
    } catch (e) {
      emit(UserState.error('Failed to load users: ${e.toString()}'));
    }
  }

  Future<void> _onLoadBookmarkedUsers() async {
    emit(const UserState.loading());
    try {
      final users = await getBookmarkedUsersUseCase();
      emit(UserState.loaded(users: users, showOnlyBookmarked: true));
    } catch (e) {
      emit(UserState.error('Failed to load bookmarked users: ${e.toString()}'));
    }
  }

  Future<void> _onToggleBookmark(UserEntity user) async {
    try {
      if (user.isBookmarked) {
        await removeBookmarkUseCase(user.userId);
      } else {
        await bookmarkUserUseCase(user);
      }

      // Update the user list with the new bookmark status
      // final updatedUsers =
      //     state.users.map((user) {
      //       if (user.userId == user.userId) {
      //         return user.copyWith(isBookmarked: !user.isBookmarked);
      //       }
      //       return user;
      //     }).toList();

      // emit(
      //   UserState.loaded(
      //     users: updatedUsers,
      //     showOnlyBookmarked: currentState.showOnlyBookmarked,
      //   ),
      // );
    } catch (e) {
      emit(UserState.error('Failed to toggle bookmark: ${e.toString()}'));
    }
  }

  Future<void> _onFilterByBookmark(bool showOnlyBookmarked) async {
    try {
      if (showOnlyBookmarked) {
        final bookmarkedUsers = await getBookmarkedUsersUseCase();
        emit(
          UserState.loaded(users: bookmarkedUsers, showOnlyBookmarked: true),
        );
      } else {
        // Reload all users
        add(const UserEvent.loadUsers());
      }
    } catch (e) {
      emit(UserState.error('Failed to filter users: ${e.toString()}'));
    }
  }
}
