import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/features/auth/data/models/signup_model.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo.dart';

import '../../../../core/utilities/api_service.dart';
import '../models/login_model.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either<Failure, LoginModel>> LoginUser() {
    // TODO: implement LoginUser
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, SignUpModel>> SignupUser(
      {required String? email,
      required String? password,
      required String? firstName,
      required String? lastName,
      required String? phone}) async {
    try {
      var response =
          await ApiService.postData(endpoint: '/api/auth/signup/', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone_number': phone,
        'address_longitude': 1.556,
        'address_latitude': 5.66,
        'user_type': "consumer",
      });
      return right(SignUpModel.fromJson(response?.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
