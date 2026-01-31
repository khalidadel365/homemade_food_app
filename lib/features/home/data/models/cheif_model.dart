class ChefModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profilePicUrl;
  final String? addressLongitude;
  final String? addressLatitude;
  final String? createdAt;
  final String? updatedAt;
  final bool? isActive;
  final String? userType;

  ChefModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profilePicUrl,
    this.addressLongitude,
    this.addressLatitude,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.userType,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) {
    return ChefModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone_number'],
      profilePicUrl: json['profile_picture_url'],
      addressLongitude: json['address_longitude'],
      addressLatitude: json['address_latitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      userType: json['user_type'],
    );
  }
}