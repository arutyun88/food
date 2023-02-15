import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/failures.dart';

abstract class ApiRequestHandler {
  const ApiRequestHandler._();

  static Future<T> send<T>({
    required Future<Response<dynamic>> request,
    required T Function(dynamic) decoder,
  }) async {
    if (await _Connection.connected()) {
      try {
        final Response response = await request;

        if (response.statusCode.toString().startsWith('2')) {
          return decoder(response.data);
        } else {
          throw _handleError(response: response);
        }
      } on DioError catch (e) {
        throw _handleError(dioError: e);
      } catch (e) {
        throw const DataError('Data processing error');
      }
    } else {
      throw const NetworkFailure('Network failure');
    }
  }

  static Failure _handleError({
    Response<dynamic>? response,
    DioError? dioError,
  }) {
    if (dioError?.type == DioErrorType.connectionTimeout ||
        dioError?.type == DioErrorType.receiveTimeout ||
        dioError?.type == DioErrorType.sendTimeout) {
      return const TimeoutError('Server takes a long time to respond');
    }

    final Response<dynamic>? error = response ?? dioError?.response;
    if (error == null) return const UnknownFailure('Unknown failure');

    switch (error.statusCode) {
      case 400:
        return const BadRequest('An error occurred while sending the request');
      case 401:
      case 403:
        return const Forbidden('Data access denied');
      case 404:
        return const NotFound('Data not found');
      case 500:
      case 502:
        return const NetworkFailure('Network failure');
      default:
        return const UnknownFailure('Unknown failure');
    }
  }
}

abstract class _Connection {
  static Future<bool> connected() async =>
      await InternetConnectionChecker().hasConnection;
}
