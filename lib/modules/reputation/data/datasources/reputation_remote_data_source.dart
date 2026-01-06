import 'package:stackoverflow_users_reputation/core/network/api_routes.dart';
import 'package:stackoverflow_users_reputation/core/network/api_service.dart';
import 'package:stackoverflow_users_reputation/core/utils/constants.dart';

import '../models/reputation_model.dart';

abstract class ReputationRemoteDataSource {
  Future<List<ReputationModel>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  });
}

class ReputationRemoteDataSourceImpl implements ReputationRemoteDataSource {
  final ApiService apiService;

  ReputationRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ReputationModel>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  }) async {
    final endpoint = ApiRoutes.reputationHistory.replaceFirst(
      '{userId}',
      userId.toString(),
    );
    final response = await apiService.get(
      endpoint: endpoint,
      queryParameters: {
        'page': page,
        'pagesize': pageSize,
        'site': AppConstants.stackoverflowSite,
      },
    );

    final List<dynamic> items = response.data['items'] ?? [];
    return items
        .map((item) => ReputationModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
