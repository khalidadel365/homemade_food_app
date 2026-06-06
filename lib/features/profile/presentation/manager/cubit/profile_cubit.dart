import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilities/api_constants.dart';
import '../../../../../core/utilities/cache_helper.dart';
import '../states/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> fetchProfile({required String token, required int id}) async {
    emit(ProfileLoading());
    var result = await profileRepo.fetchUserData(
      token: token,
      id: id,
    );
    result.fold((failure) {
      emit(ProfileFailure(failure.errorMessage));
    }, (profile) {
      emit(ProfileSuccess(profile));
    });
  }

  Future<void> editProfile(
      {required String token,
      required int id,
      required Map<String, dynamic> data}) async {
    emit(EditProfileLoading());
    var result = await profileRepo.editUserData(
      token: token,
      id: id,
      data: data,
    );
    result.fold((failure) {
      emit(EditProfileFailure(failure.errorMessage));
    }, (profile) {
      emit(EditProfileSuccess(profile));
    });
  }

  Future<void> updateProfileImage(
      {required String token, required XFile imageProfile}) async {
    emit(UpdateProfileImageLoading());
    var result = await profileRepo.updateProfileImage(
      token: token,
      imageProfile: imageProfile,
    );
    result.fold((failure) {
      emit(UpdateProfileImageFailure(failure.errorMessage));
    }, (accountInfo) {
      emit(UpdateProfileImageSuccess(accountInfo));
    });
  }

  Future<void> resetPasswordRequest(
      {required String token, required String email}) async {
    emit(ResetPasswordRequestLoading());
    var result = await profileRepo.resetPasswordRequest(
      token: token,
      email: email,
    );
    result.fold((failure) {
      print('^^^^^^^^ ${failure.errorMessage}');
      emit(ResetPasswordRequestFailure(failure.errorMessage));
    }, (resetPasswordModel) {
      emit(ResetPasswordRequestSuccess(resetPasswordModel));
    });
  }

  Future<void> resetPasswordConfirm({required String password}) async {
    emit(ResetPasswordConfirmLoading());
    var result = await profileRepo.confirmPassword(
      password: password,
    );
    result.fold((failure) {
      print('^^^^^^^^ ${failure.errorMessage}');
      emit(ResetPasswordConfirmFailure(failure.errorMessage));
    }, (confirmPassword) {
      emit(ResetPasswordConfirmSuccess(confirmPassword));
    });
  }
  Future<void> logout({required String token}) async {
    emit(LogoutLoadingState());
    var result = await profileRepo.logout(token: token);

    result.fold(
          (failure) => emit(LogoutFailureState(failure.errorMessage)),
          (logoutModel) async {
        await CacheHelper.removeData(key: 'token');
        ApiConstants.token = null;
        emit(LogoutSuccessState(logoutModel));
      },
    );
  }
}
