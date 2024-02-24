import 'package:dio/dio.dart';

class DioHelper {
  static const String _baseUrl = "";

  DioHelper() {
    dioSetUp();
  }
  Dio dioSetUp() {
    final BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        responseHeader: false,
        requestHeader: false,
        request: true,
      ),
    );
    return dio;
  }
}
