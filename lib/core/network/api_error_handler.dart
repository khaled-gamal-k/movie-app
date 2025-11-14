import 'package:dio/dio.dart';
import 'api_error_model.dart';

abstract class ApiErrorHandler {
  final String message;
  ApiErrorHandler(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends ApiErrorHandler {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException error) {
    try {
      if (error.response != null) {
        final statusCode = error.response?.statusCode ?? 500;
        final data = error.response?.data;

        if (data is Map<String, dynamic>) {
          final apiError = ApiErrorModel.fromJson(data);
          return ServerFailure.fromResponse(statusCode, apiError.message ?? '');
        }

        if (data is String) {
          return ServerFailure.fromResponse(statusCode, data);
        }

        return ServerFailure.fromResponse(
          statusCode,
          'Something went wrong. Please try again.',
        );
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ServerFailure(
            'Connection timed out. Please check your internet.',
          );
        case DioExceptionType.sendTimeout:
          return ServerFailure('Request took too long. Try again.');
        case DioExceptionType.receiveTimeout:
          return ServerFailure('Server took too long to respond.');
        case DioExceptionType.badCertificate:
          return ServerFailure('Secure connection failed. Please try again.');
        case DioExceptionType.badResponse:
          return ServerFailure('Server returned an unexpected response.');
        case DioExceptionType.cancel:
          return ServerFailure('Request was cancelled.');
        case DioExceptionType.connectionError:
          return ServerFailure('Couldn’t connect. Please check your internet.');
        case DioExceptionType.unknown:
          if (error.message?.contains('SocketException') ?? false) {
            return ServerFailure('No internet connection.');
          }
          return ServerFailure('Something went wrong. Please try again later.');
      }
    } catch (e) {
      return ServerFailure('Something went wrong. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return ServerFailure('Invalid request. Please check your input.');
      case 401:
        return ServerFailure('Your session has expired. Please log in again.');
      case 403:
        return ServerFailure('You don’t have permission to do this.');
      case 404:
        return ServerFailure('We couldn’t find what you’re looking for.');
      case 405:
        return ServerFailure('Action not allowed. Please try again.');
      case 409:
        return ServerFailure('There’s a conflict. Please try again.');
      case 500:
        return ServerFailure('Server error. Please try again later.');
      case 503:
        return ServerFailure('Server is busy. Please try again later.');
      default:
        return ServerFailure('Error $statusCode: Something went wrong.');
    }
  }
}
