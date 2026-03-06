import 'package:homemade_food_app/core/utilities/api_constants.dart';

class AccountInfo {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profilePicUrl ;
  final String? address_longitude;
  final String? address_latitude;
  final bool? isActive;
  final String? userType;

  AccountInfo({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profilePicUrl,
    this.address_longitude,
    this.address_latitude,
    this.userType,
    this.isActive,});
  String? get fullProfilePicUrl {
    if (profilePicUrl == null) return null;
    return "${ApiConstants.baseUrl}$profilePicUrl";
  }
  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone_number'],
      profilePicUrl: json['profile_picture'],
      address_longitude: json['address_longitude'],
      address_latitude: json['address_latitude'],
      userType: json['user_type'],
      isActive: json['is_active'],
    );
  }
}