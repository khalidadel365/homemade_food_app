import 'package:dartz/dartz.dart';
import 'package:homemade_food_app/features/auth/data/models/login_model.dart';
import 'package:homemade_food_app/features/auth/data/models/signup_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpModel>> SignupUser({
    required String? email,
    required String? password,
    required String? firstName,
    required String? lastName,
    required String? phone,
  });

  Future<Either<Failure, LoginModel>> LoginUser();
}
