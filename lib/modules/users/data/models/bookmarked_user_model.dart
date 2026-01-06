import 'package:hive/hive.dart';

part 'bookmarked_user_model.g.dart';

@HiveType(typeId: 1)
class BookmarkedUserModel extends HiveObject {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final String displayName;

  @HiveField(2)
  final String? profileImage;

  @HiveField(3)
  final int reputation;

  BookmarkedUserModel({
    required this.userId,
    required this.displayName,
    this.profileImage,
    required this.reputation,
  });
}
