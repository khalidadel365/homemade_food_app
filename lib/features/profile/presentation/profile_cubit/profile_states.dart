import 'package:homemade_food_app/features/profile/data/models/profile_model.dart';


abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}
class ProfileLoading extends ProfileStates {}
class ProfileFailure extends ProfileStates {
  final String errMessage;
  ProfileFailure(this.errMessage);
}
class ProfileSuccess extends ProfileStates {
  ProfileModel profileModel;
  ProfileSuccess(this.profileModel);
}

class EditProfileLoading extends ProfileStates {}
class EditProfileFailure extends ProfileStates {
  final String errMessage;
  EditProfileFailure(this.errMessage);
}
class EditProfileSuccess extends ProfileStates {
  ProfileModel profileModel;
  EditProfileSuccess(this.profileModel);
}