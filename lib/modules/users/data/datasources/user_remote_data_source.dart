import 'package:stackoverflow_users_reputation/core/network/api_service.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers({required int page, required int pageSize});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<UserModel>> getUsers({
    required int page,
    required int pageSize,
  }) async {
    final response = await apiService.get(
      endpoint: 'users',
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
  }
}
