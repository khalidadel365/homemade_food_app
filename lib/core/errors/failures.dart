import 'package:dio/dio.dart';

abstract class Failure  {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException exception){
    switch(exception.type){
      case DioExceptionType.connectionTimeout:

        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse: //**********
        return ServerFailure.fromResponse(exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('There is Connection Error');
      case DioExceptionType.unknown:
      if(exception.message!.contains('SocketException')){
        return ServerFailure('No Internet Connection');
      }
      else{
        return ServerFailure('No Internet Connection');
      }
      default:
        return ServerFailure('Unexpected Error, please try again');
      }
  }
  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      final emailError = response['email'] != null ? response['email'][0] : null;
      final phoneError = response['phone_number'] != null ? response['phone_number'][0] : null;
      String message;
      if (emailError != null && phoneError != null) {
        print('email & pass  repeated');
        message = 'Both the email and phone number are already registered.';
      } else if (emailError != null) {
        message = emailError;
      } else if (phoneError != null) {
        message = phoneError;
      } else {
        message = 'Authentication error';
      }

      return ServerFailure(message);
    }
    else if(statusCode == 404){
      return ServerFailure('Opps there was an error, please try again');
    }
    else if (statusCode == 500){
      return ServerFailure('Internal server error, please try again later');
    }
    else{
      return ServerFailure('Opps there was an error, please try again');
    }
  }
}

