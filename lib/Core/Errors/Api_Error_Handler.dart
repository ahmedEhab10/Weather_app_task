import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

class ApiErrorHandler {
  static Failure handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkFailure("Connection timeout");

      case DioExceptionType.sendTimeout:
        return const NetworkFailure("Send timeout");

      case DioExceptionType.receiveTimeout:
        return const NetworkFailure("Receive timeout");

      case DioExceptionType.transformTimeout:
        return const NetworkFailure("Response parsing timeout");

      case DioExceptionType.connectionError:
        return const NetworkFailure("No internet connection");

      case DioExceptionType.cancel:
        return const UnknownFailure("Request cancelled");

      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad certificate");

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NetworkFailure("No internet connection");
        }
        return const UnknownFailure("Something went wrong");
    }
  }

  static Failure _handleStatusCode(Response? response) {
    switch (response?.statusCode) {
      case 400:
        return ServerFailure(
          response?.data["error"]["message"] ?? "Bad Request",
        );

      case 401:
        return const ServerFailure("Unauthorized");

      case 403:
        return const ServerFailure("Forbidden");

      case 404:
        return const ServerFailure("Not found");

      case 500:
        return const ServerFailure("Internal server error");

      case 503:
        return const ServerFailure("Service unavailable");

      default:
        return ServerFailure(
          response?.data["message"] ?? "Unexpected server error",
        );
    }
  }
}
