import 'dart:io';

import 'package:dio/dio.dart';

class ApiErrorHandler {
  static Exception handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Exception("Connection timeout");

      case DioExceptionType.sendTimeout:
        return Exception("Send timeout");

      case DioExceptionType.receiveTimeout:
        return Exception("Receive timeout");

      case DioExceptionType.connectionError:
        return Exception("No internet connection");

      case DioExceptionType.cancel:
        return Exception("Request cancelled");

      case DioExceptionType.badCertificate:
        return Exception("Bad certificate");

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return Exception("No internet connection");
        }

        return Exception("Something went wrong");
      case DioExceptionType.transformTimeout:
        return Exception("Transform timeout");
    }
  }

  static Exception _handleStatusCode(Response? response) {
    switch (response?.statusCode) {
      case 400:
        return Exception("Bad request");

      case 401:
        return Exception("Unauthorized");

      case 403:
        return Exception("Forbidden");

      case 404:
        return Exception("Not found");

      case 500:
        return Exception("Internal server error");

      case 502:
        return Exception("Bad gateway");

      case 503:
        return Exception("Service unavailable");

      default:
        return Exception(
          response?.data["message"] ?? "Unexpected server error",
        );
    }
  }
}
