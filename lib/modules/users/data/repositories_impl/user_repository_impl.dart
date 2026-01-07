import '../../domain/entities/badge_counts_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/bookmarked_user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<UserEntity>> getUsers({
    required int page,
    required int pageSize,
  }) async {
    final models = await remoteDataSource.getUsers(
      page: page,
      pageSize: pageSize,
    );

    // Convert models to entities and add bookmark status
    final entities = await Future.wait(
      models.map((model) async {
        final isBookmarked = await localDataSource.isUserBookmarked(
          model.userId,
        );
        return UserEntity(
          userId: model.userId,
          displayName: model.displayName,
          profileImage: model.profileImage,
          reputation: model.reputation,
          badgeCounts:
              model.badgeCounts != null
                  ? BadgeCountsEntity(
                    bronze: model.badgeCounts!.bronze,
                    silver: model.badgeCounts!.silver,
                    gold: model.badgeCounts!.gold,
                  )
                  : null,
          location: model.location,
          websiteUrl: model.websiteUrl,
          isBookmarked: isBookmarked,
        );
      }),
    );

    return entities;
  }

  @override
  Future<void> bookmarkUser(UserEntity user) async {
    final model = BookmarkedUserModel(
      userId: user.userId,
      displayName: user.displayName,
      profileImage: user.profileImage,
      reputation: user.reputation,
    );
    await localDataSource.addBookmark(model);
  }

  @override
  Future<void> removeBookmark(int userId) async {
    await localDataSource.removeBookmark(userId);
  }

  @override
  Future<List<UserEntity>> getBookmarkedUsers() async {
    final models = await localDataSource.getAllBookmarks();
    return models
        .map(
          (model) => UserEntity(
            userId: model.userId,
            displayName: model.displayName,
            profileImage: model.profileImage,
            reputation: model.reputation,
            isBookmarked: true,
          ),
        )
        .toList();
  }

  @override
  Future<bool> isUserBookmarked(int userId) async {
    return await localDataSource.isUserBookmarked(userId);
  }
}
