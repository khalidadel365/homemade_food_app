import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('There is Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    Map<String, dynamic> responseData;
    if (response is Map<String, dynamic>) {
      responseData = response;
    } else if (response is String) {
      return ServerFailure(response);
    } else {
      responseData = {};
    }

    if (responseData['message'] != null) {
      return ServerFailure(responseData['message'].toString());
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final editError = responseData['user'];
      final loginError = responseData['detail'];
      final emailError = responseData['email'] != null ? responseData['email'][0] : null;
      final changePasswordEmailError = responseData['detail'];
      final phoneError = responseData['phone_number'] != null ? responseData['phone_number'][0] : null;

      String message;
      if (emailError != null && phoneError != null) {
        message = 'Both the email and phone number are already registered.';
      } else if (emailError != null) {
        message = emailError;
      } else if (phoneError != null) {
        message = phoneError;
      } else if (loginError != null) {
        message = loginError;
      } else if (editError != null) {
        message = editError['email'];
      } else if (changePasswordEmailError != null) {
        message = changePasswordEmailError;
      } else {
        message = 'Authentication error';
      }

      return ServerFailure(message);
    } else if (statusCode == 404) {
      return ServerFailure('Opps there was an error, please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later');
    } else {
      return ServerFailure('Opps there was an error, please try again');
    }
  }
}