import 'package:dio/dio.dart';
import 'package:weather_app/Core/Errors/Api_Error_Handler.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio;

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (_) {
      throw Exception('Unexpected error occurred.');
    }
  }
}
