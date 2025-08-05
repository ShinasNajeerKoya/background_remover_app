import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../shared/helper_functions/exception_helper.dart';


/// A reusable API client using Dio that supports GET, POST, PUT, DELETE
/// operations with error handling and typed responses.
///
/// Designed for Clean Architecture and scalable use in repositories.
class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio, String? authToken})
      : _dio = dio ??
            Dio(BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 15),
              sendTimeout: const Duration(seconds: 10),
              contentType: 'application/json',
              responseType: ResponseType.json,
            )) {
    _dio.interceptors.add(LogInterceptor(
      // requestBody: true,
      // responseBody: true,
      request: false,
      requestHeader: false,
      requestBody: false,
      responseBody: false,
      responseHeader: false,
      error: true,
      logPrint: (Object object) {},
    ));

    // Optional: Add Authorization header interceptor
    if (authToken != null) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer $authToken';
            handler.next(options);
          },
        ),
      );
    }
  }

  /// Generic GET method that returns parsed JSON as a Map.
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return _parseResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
    return {};
  }

  /// Generic POST method that sends JSON body and returns parsed response.
  Future<Map<String, dynamic>> post(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return _parseResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
    return {};
  }

  /// Generic PUT method.
  Future<Map<String, dynamic>> put(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return _parseResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
    return {};
  }

  /// Generic DELETE method.
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers),
      );
      return _parseResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
    return {};
  }

  /// Typed GET method using a fromJson converter function.
  /// Useful for decoding directly to model objects from repo layer.
  Future<T> getTyped<T>(
    String url, {
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final json = await get(url, queryParams: queryParams, headers: headers);
    return fromJson(json);
  }

  /// Parses Dio response and handles status codes.
  /// Returns an empty map for 204 (no content), or wraps non-map data in {"data": ...}
  Map<String, dynamic> _parseResponse(Response response) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode == 204 || response.data == null) {
      return {}; // No content response
    }

    if (statusCode >= 200 && statusCode < 300) {
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        // Wrap non-map (list or string) into a map
        return {"data": response.data};
      }
    }

    throw ApiException(
      "Unexpected status code: $statusCode",
      statusCode: statusCode,
    );
  }

  /// Handles Dio-specific errors and maps them to custom ApiException.
  void _handleDioError(DioException error) {
    String message = "Unexpected error occurred";
    int? statusCode;

    if (error.response != null) {
      statusCode = error.response?.statusCode;
      final data = error.response?.data;
      if (data is Map && data['message'] != null) {
        message = data['message'];
      } else {
        message = data?.toString() ?? error.message ?? "Unknown error";
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = "Connection timeout. Please try again later.";
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
          message = "Server error: ${error.message}";
          break;
        case DioExceptionType.cancel:
          message = "Request cancelled.";
          break;
        case DioExceptionType.connectionError:
          message = "No internet connection.";
          break;
        case DioExceptionType.unknown:
        default:
          message = "Something went wrong: ${error.message}";
          break;
      }
    }

    log("API Error [$statusCode]: $message");
    throw ApiException(message, statusCode: statusCode);
  }
}

