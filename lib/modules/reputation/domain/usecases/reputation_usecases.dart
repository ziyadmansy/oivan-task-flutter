import '../../domain/entities/reputation_history_entity.dart';
import '../../domain/repositories/reputation_repository.dart';

class GetReputationHistoryUseCase {
  final ReputationRepository repository;

  GetReputationHistoryUseCase({required this.repository});

  Future<List<ReputationHistoryEntity>> call({
    required int userId,
    required int page,
    required int pageSize,
  }) async {
    return await repository.getReputationHistory(
      userId: userId,
      page: page,
      pageSize: pageSize,
    );
  }
}
