import '../../domain/entities/reputation_history_entity.dart';
import '../../domain/enums/reputation_history_type.dart';
import '../../domain/repositories/reputation_repository.dart';
import '../datasources/reputation_remote_data_source.dart';

class ReputationRepositoryImpl implements ReputationRepository {
  final ReputationRemoteDataSource remoteDataSource;

  ReputationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ReputationHistoryEntity>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  }) async {
    final models = await remoteDataSource.getReputationHistory(
      userId: userId,
      page: page,
      pageSize: pageSize,
    );

    return models
        .map(
          (model) => ReputationHistoryEntity(
            reputationHistoryType: ReputationHistoryType.fromString(
              model.reputationHistoryType,
            ),
            userId: model.userId,
            reputationChange: model.reputationChange,
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              model.creationDate * 1000,
            ),
            postId: model.postId,
          ),
        )
        .toList();
  }
}
