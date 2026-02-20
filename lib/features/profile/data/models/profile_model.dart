import 'package:homemade_food_app/features/profile/data/models/user_model.dart';

class ProfileModel {
  final int? id;
  final UserModel? userData;

  ProfileModel({this.id, this.userData});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      userData: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}


