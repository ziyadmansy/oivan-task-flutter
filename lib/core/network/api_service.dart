
import 'package:dio/dio.dart';
import 'package:stackoverflow_users_reputation/core/errors/custom_exceptions/api_exception.dart';
import 'package:stackoverflow_users_reputation/core/network/api_routes.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'custom_interceptors.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  late final Dio _dio;

  /// Expose Dio instance for other services (e.g., PdfDownloadService)
  Dio get dio => _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiRoutes.baseUrl,
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json;charset=UTF-8',
        },
      ),
    );

    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );

    _dio.interceptors.add(CustomInterceptors());
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['succeeded'] == false) {
        throw ApiException(
          message: response.data['detail'] ?? response.data['message'],
          statusCode: response.statusCode,
          data: response.data,
          code: response.data['code'],
        );
      }
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipErrorHandling = false,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (!skipErrorHandling && response.data['succeeded'] == false) {
        throw ApiException(
          message: response.data['detail'] ?? response.data['message'],
          statusCode: response.statusCode,
          data: response.data,
          code: response.data['code'],
        );
      }
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['succeeded'] == false) {
        throw ApiException(
          message: response.data['detail'] ?? response.data['message'],
          statusCode: response.statusCode,
          data: response.data,
          code: response.data['code'],
        );
      }
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['succeeded'] == false) {
        throw ApiException(
          message: response.data['detail'] ?? response.data['message'],
          statusCode: response.statusCode,
          data: response.data,
          code: response.data['code'],
        );
      }
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    print('DioException: ${e.message}');
    print('DioException: ${e.response?.statusCode}');
    print('DioException: ${e.response?.data}');

    if (e.type == DioExceptionType.connectionError) {
      return ApiException(
        message:
            'Network error, please check your internet connection and try again.',
        statusCode: e.response?.statusCode,
      );
    }

    // if (e.response?.statusCode == AppStatusCodes.unauthenticated) {
    //   return ApiException(
    //     message: S.current.sessionExpiredPleaseLoginAgain,
    //     statusCode: e.response?.statusCode,
    //   );
    // }

    if (e.response?.data is Map) {
      return ApiException(
        message:
            e.response?.data['message'] ??
            e.response?.data['detail'] ??
            'Something went wrong, please try again later.',
        statusCode: e.response?.statusCode,
        code: e.response?.data['code'],
        data: e.response?.data,
      );
    }

    return ApiException(
      message:
          '${e.response?.statusCode ?? ''} - Something went wrong, please try again later.',
      statusCode: e.response?.statusCode,
    );
  }
}
