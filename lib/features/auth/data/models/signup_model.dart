class SignUpModel {
  final int? id;
  final UserSignUpData? userData;
  SignUpModel({this.id,this.userData});
  factory SignUpModel.fromJson(Map<String,dynamic> json){
    return SignUpModel(
        id:  json['id'],
        userData:  json['user'] != null? UserSignUpData.fromJson(json['user']):null,
    );
  }
}


class UserSignUpData {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phone;
  final String? userType;
  UserSignUpData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.userType,
});
  factory UserSignUpData.fromJson(Map<String,dynamic> json){
    return UserSignUpData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone_number'],
      userType: json['user_type'],
    );
  }
}

