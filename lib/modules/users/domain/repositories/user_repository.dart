import '../../domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers({required int page, required int pageSize});
  Future<void> bookmarkUser(UserEntity user);
  Future<void> removeBookmark(int userId);
  Future<List<UserEntity>> getBookmarkedUsers();
  Future<bool> isUserBookmarked(int userId);
}
