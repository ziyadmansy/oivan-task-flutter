import 'dart:developer';

import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Do something before request is sent.
    // If you want to resolve the request with custom data,
    // you can resolve a `Response` using `handler.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject with a `DioException` using `handler.reject(dioError)`.
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    log('HEADERS: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data.
    // If you want to reject the request with a error message,
    // you can reject a `DioException` object using `handler.reject(dioError)`.
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    if (response.statusCode == 401) {
      // Handle 401 error
      print('Unauthenticated');
      // _handleUnauthenticated();
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // Do something with response error.
    // If you want to resolve the request with some custom data,
    // you can resolve a `Response` object using `handler.resolve(response)`.
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    if (err.response?.statusCode == 401) {
      print('Unauthenticated');
      // await _handleUnauthenticated();
    }
    super.onError(err, handler);
  }
}
