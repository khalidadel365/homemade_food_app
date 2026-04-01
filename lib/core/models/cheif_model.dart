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
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone_number'] as String?,
      profilePicUrl: json['profile_picture_url'] as String?,
      addressLongitude: json['address_longitude'] as String?,
      addressLatitude: json['address_latitude'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isActive: json['is_active'] as bool?,
      userType: json['user_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phone,
      'profile_picture_url': profilePicUrl,
      'address_longitude': addressLongitude,
      'address_latitude': addressLatitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_active': isActive,
      'user_type': userType,
    };
  }
}
