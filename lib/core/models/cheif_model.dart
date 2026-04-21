class ChefModel {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? profilePicUrl;
  final double? rating;
  final int? totalReviews;
  final String? cuisineSpecialties;
  final String? email;
  final String? phone;

  ChefModel({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.profilePicUrl,
    this.rating,
    this.totalReviews,
    this.cuisineSpecialties,
    this.email,
    this.phone,
  });
  factory ChefModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>?;

    return ChefModel(
      id: json['id'] as int?,
      userId: userData?['id'] as int?,
      firstName: json['name'] as String? ??
          json['first_name'] as String? ??
          userData?['first_name'] as String? ??
          json['chef_name'] as String?,
      lastName: json['last_name'] as String? ??
          userData?['last_name'] as String? ??
          '',
      profilePicUrl: json['profile_picture'] as String? ??
          userData?['profile_picture'] as String? ??
          json['image_url'] as String? ??
          json['image'] as String?,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      totalReviews: json['total_reviews'] as int?,
      cuisineSpecialties: json['cuisine_specialties'] as String? ??
          (json['specialties'] is List
              ? (json['specialties'] as List).join(', ')
              : null),
    );
  }
  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();
}
