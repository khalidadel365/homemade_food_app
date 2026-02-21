import 'package:homemade_food_app/features/auth/data/models/signup_model.dart';

class LoginModel {
  final String? token;
  final UserSignUpData? userData;

  LoginModel({this.token, this.userData});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      userData: json['user'] != null ? UserSignUpData.fromJson(json['user']) : null,
    );
  }
}


