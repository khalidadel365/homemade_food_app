
import 'package:homemade_food_app/features/auth/data/models/user_data.dart';

class ProfileModel {
  final int? id;
  final UserData? userData;

  ProfileModel({this.id, this.userData});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      userData: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}


