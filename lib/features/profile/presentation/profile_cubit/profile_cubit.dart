import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';


class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> fetchProfile({required String token,required int id}) async {
    emit(ProfileLoading());
    var result =await profileRepo.fetchUserData(
        token: token,
        id: id,
    );
    result.fold((failure){
      emit(ProfileFailure(failure.errorMessage));
    }, (profile){
      emit(ProfileSuccess(profile));
    });
  }
  Future<void> editProfile({required String token,required int id,required Map<String,dynamic> data}) async {
    emit(EditProfileLoading());
    var result =await profileRepo.editUserData(
      token: token,
      id: id,
      data: data,
    );
    result.fold((failure){
      emit(EditProfileFailure(failure.errorMessage));
    }, (profile){
      emit(EditProfileSuccess(profile));
    });
  }
  Future<void> updateProfileImage({required String token,required XFile imageProfile}) async {
    emit(UpdateProfileImageLoading());
    var result =await profileRepo.updateProfileImage(
      token: token,
      imageProfile: imageProfile,
    );
    result.fold((failure){
      emit(UpdateProfileImageFailure(failure.errorMessage));
    }, (accountInfo){
      emit(UpdateProfileImageSuccess(accountInfo));
    });
  }
}