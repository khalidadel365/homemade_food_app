import 'package:dartz/dartz.dart';
import 'package:homemade_food_app/features/profile/data/models/password_confirm_model.dart';
import 'package:homemade_food_app/features/profile/data/models/password_reset_request_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/models/account_info.dart';
import '../../../../core/models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> fetchUserData(
      // for chef and consumer
      {required String token,
      required int? id});
  Future<Either<Failure, ProfileModel>> editUserData(
      {required String token,
      required Map<String, dynamic> data,
      required int? id});
  Future<Either<Failure, AccountInfo>> updateProfileImage(
      {required String token, required XFile imageProfile});
  Future<Either<Failure, PasswordResetRequestModel>> resetPasswordRequest(
      {required String token, required String email});
  Future<Either<Failure, PasswordConfirmModel>> confirmPassword(
      {required String password});
}
