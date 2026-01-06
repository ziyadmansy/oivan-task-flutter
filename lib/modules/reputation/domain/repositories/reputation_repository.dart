import '../../domain/entities/reputation_history_entity.dart';

abstract class ReputationRepository {
  Future<List<ReputationHistoryEntity>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  });
}
