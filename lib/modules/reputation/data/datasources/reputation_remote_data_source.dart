import 'package:dio/dio.dart';

import '../models/reputation_model.dart';

abstract class ReputationRemoteDataSource {
  Future<List<ReputationModel>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  });
}

class ReputationRemoteDataSourceImpl implements ReputationRemoteDataSource {
  final Dio dio;

  ReputationRemoteDataSourceImpl({required this.dio});

  static const String baseUrl = 'https://api.stackexchange.com/2.2';

  @override
  Future<List<ReputationModel>> getReputationHistory({
    required int userId,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/users/$userId/reputation-history',
        queryParameters: {
          'page': page,
          'pagesize': pageSize,
          'site': 'stackoverflow',
        },
      );

      final List<dynamic> items = response.data['items'] ?? [];
      return items
          .map((item) => ReputationModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch reputation history: $e');
    }
  }
}
