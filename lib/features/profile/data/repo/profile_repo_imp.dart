import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo.dart';
import 'package:homemade_food_app/features/auth/data/models/account_info.dart';
import 'package:homemade_food_app/features/profile/data/models/password_confirm_model.dart';
import 'package:homemade_food_app/features/profile/data/models/password_reset_request_model.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utilities/api_service.dart';
import '../../../../core/models/profile_model.dart';

class ProfileRepoImp extends ProfileRepo {
  final ApiService apiService;
  final AllDishesRepo allDishesRepo;

  ProfileRepoImp(this.apiService, this.allDishesRepo);

  Future<Either<Failure, ProfileModel>> fetchUserData(
      {required String token, required int? id}) async {
    try {
      final data = await apiService.get(
          endPoint: '/api/auth/profile/$id/', token: token);

      var profileModel = ProfileModel.fromJson(data);

      if (profileModel.userData?.accountInfo?.userType == 'chef') {
        final dishesResult = await allDishesRepo.fetchAllDishes(chefId: id);

        return dishesResult.fold(
          (failure) => left(failure),
          (dishesList) {
            return right(profileModel.copyWith(dishes: dishesList));
          },
        );
      }

      return right(profileModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> editUserData(
      {required String token,
      required Map<String, dynamic> data,
      required int? id}) async {
    Map<String, dynamic> userData = {
      "user": data,
    };

    try {
      final res = await apiService.patchData(
        endpoint: '/api/auth/profile/$id/',
        data: userData,
        token: token,
      );

      final profileModel = ProfileModel.fromJson(res!.data);

      return right(profileModel);
    } on DioException catch (e) {
      print(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountInfo>> updateProfileImage(
      {required String token, required XFile imageProfile}) async {
    final multipartFile = await MultipartFile.fromFile(
      imageProfile.path,
      filename: imageProfile.name,
    );
    try {
      final res = await apiService.postData(
        endpoint: '/api/auth/profile-picture/',
        data: FormData.fromMap({
          'profile_picture': multipartFile,
        }),
        token: token,
      );

      final accountInfoModel = AccountInfo.fromJson(res!.data);
      print('finish try call func');

      return right(accountInfoModel);
    } on DioException catch (e) {
      print(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  late PasswordResetRequestModel passwordResetMessage;

  @override
  Future<Either<Failure, PasswordResetRequestModel>> resetPasswordRequest(
      {required String token, required String email}) async {
    try {
      final res = await apiService.postData(
        endpoint: '/api/auth/password-reset/',
        data: {
          'email': email,
        },
        token: token,
      );

      passwordResetMessage = PasswordResetRequestModel.fromJson(res!.data);

      return right(passwordResetMessage);
    } on DioException catch (e) {
      print(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PasswordConfirmModel>> confirmPassword(
      {required String password}) async {
    String uid = passwordResetMessage.uId!;
    String token = passwordResetMessage.token!;
    print(passwordResetMessage.uId!);
    print(passwordResetMessage.token!);
    try {
      final res = await apiService.postData(
        endpoint: '/api/auth/password-reset-confirm/',
        data: {
          "uid": uid,
          "token": token,
          "new_password": password,
        },
      );

      final passwordConfirm = PasswordConfirmModel.fromJson(res!.data);

      return right(passwordConfirm);
    } on DioException catch (e) {
      print(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
