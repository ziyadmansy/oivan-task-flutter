import 'package:hive/hive.dart';

import '../models/bookmarked_user_model.dart';

abstract class UserLocalDataSource {
  Future<void> addBookmark(BookmarkedUserModel user);
  Future<void> removeBookmark(int userId);
  Future<bool> isUserBookmarked(int userId);
  Future<List<BookmarkedUserModel>> getAllBookmarks();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const String bookmarksBoxName = 'bookmarked_users';

  @override
  Future<void> addBookmark(BookmarkedUserModel user) async {
    final box = await Hive.openBox<BookmarkedUserModel>(bookmarksBoxName);
    await box.put(user.userId.toString(), user);
  }

  @override
  Future<void> removeBookmark(int userId) async {
    final box = await Hive.openBox<BookmarkedUserModel>(bookmarksBoxName);
    await box.delete(userId.toString());
  }

  @override
  Future<bool> isUserBookmarked(int userId) async {
    final box = await Hive.openBox<BookmarkedUserModel>(bookmarksBoxName);
    return box.containsKey(userId.toString());
  }

  @override
  Future<List<BookmarkedUserModel>> getAllBookmarks() async {
    final box = await Hive.openBox<BookmarkedUserModel>(bookmarksBoxName);
    return box.values.toList();
  }
}
