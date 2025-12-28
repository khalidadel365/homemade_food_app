class AuthModel {
  int? id;
  UserData? userData;


   AuthModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    userData = json['data'] != null? UserData.fromJson(json['user']):null ;
  }
}


class UserData {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  int? id;

  UserData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone_number'];
  }
}