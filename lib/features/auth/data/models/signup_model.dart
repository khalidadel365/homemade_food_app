import 'package:dio/dio.dart';

class SignUpModel {
  int? id;
  UserData? userData;


   SignUpModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    userData = json['data'] != null? UserData.fromJson(json['user']):null ;
  }
}


class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? userType;

  UserData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone_number'];
    userType = json['user_type'];
  }
}