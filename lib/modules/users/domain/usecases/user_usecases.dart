import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  Future<List<UserEntity>> call({
    required int page,
    required int pageSize,
  }) async {
    return await repository.getUsers(page: page, pageSize: pageSize);
  }
}

class BookmarkUserUseCase {
  final UserRepository repository;

  BookmarkUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    await repository.bookmarkUser(user);
  }
}

class RemoveBookmarkUseCase {
  final UserRepository repository;

  RemoveBookmarkUseCase({required this.repository});

  Future<void> call(int userId) async {
    await repository.removeBookmark(userId);
  }
}

class GetBookmarkedUsersUseCase {
  final UserRepository repository;

  GetBookmarkedUsersUseCase({required this.repository});

  Future<List<UserEntity>> call() async {
    return await repository.getBookmarkedUsers();
  }
}

class IsUserBookmarkedUseCase {
  final UserRepository repository;

  IsUserBookmarkedUseCase({required this.repository});

  Future<bool> call(int userId) async {
    return await repository.isUserBookmarked(userId);
  }
}
