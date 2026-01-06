import 'package:dio/dio.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers({required int page, required int pageSize});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  static const String baseUrl = 'https://api.stackexchange.com/2.2';

  @override
  Future<List<UserModel>> getUsers({
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/users',
        queryParameters: {
          'page': page,
          'pagesize': pageSize,
          'site': 'stackoverflow',
          'order': 'desc',
          'sort': 'reputation',
        },
      );

      final List<dynamic> items = response.data['items'] ?? [];
      return items
          .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
