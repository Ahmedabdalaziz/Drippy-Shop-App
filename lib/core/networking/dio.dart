import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static const Duration timeOut = Duration(seconds: 45);
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      final dio = Dio(
        BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut),
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
