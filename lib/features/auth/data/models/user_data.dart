import 'account_info.dart';

class UserData {
  final int? id;
  final AccountInfo? accountInfo;

  UserData({
    required this.id,
    required this.accountInfo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      accountInfo: AccountInfo.fromJson(json),
    );
  }
}