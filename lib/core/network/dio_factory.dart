import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../extensions/strings_extensions.dart';

import 'endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/app_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;

  static Dio get dio => _dioInstance ??= _createDio();

  static Dio _createDio() {
    const timeOut = Duration(seconds: 30);
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        followRedirects: true,
        maxRedirects: 5,
      ),
    );

    dio.interceptors.addAll([
      _createAuthInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ]);

    return dio;
  }

  static InterceptorsWrapper _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = dotenv.env[AppConstants.accessToken];
        if (token.isNotNullOrEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    );
  }
}
