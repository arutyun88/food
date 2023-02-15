import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api.dart';

class ApiDio {
  static late final Dio _dio;

  Dio get dio => _dio;

  static final instance = ApiDio._();

  ApiDio._() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 15000),
    );
    _dio = Dio(options);
    if (kDebugMode) _addInterceptor(PrettyDioLogger());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    _dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    _dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }
}
