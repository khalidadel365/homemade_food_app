import 'account_info_model.dart';

class UserModel {
  final int? id;
  final AccountInfo? accountInfo;

  UserModel({this.id, this.accountInfo});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      accountInfo: AccountInfo.fromJson(json),
    );
  }
}
