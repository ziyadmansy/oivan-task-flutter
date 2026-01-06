class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final int? code;
  final dynamic data;
  ApiException({
    required this.message,
    required this.statusCode,
    this.code,
    this.data,
  });

  @override
  String toString() {

    return statusCode != null && statusCode != 200
        ? '$message - $statusCode'
        : message;

  }
}
