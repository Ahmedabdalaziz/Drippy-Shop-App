import 'package:dio/dio.dart';
import 'package:drippydrop_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static const Duration timeOut = Duration(seconds: 30);
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'apikey': ApiConstants.apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );

      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      );

      _dio = dio;
    }

    return _dio!;
  }
}
