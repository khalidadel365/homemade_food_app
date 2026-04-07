class ChefModel {
  final int? id;
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
    final Map<String, dynamic>? userData =
        json['user'] is Map<String, dynamic> ? json['user'] : null;

    return ChefModel(
      id: json['id'] as int?,
      firstName: (json['first_name'] ?? userData?['first_name']) as String?,
      lastName: (json['last_name'] ?? userData?['last_name']) as String?,
      profilePicUrl: (json['profile_picture'] ??
          json['profile_picture_url'] ??
          userData?['profile_picture']) as String?,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      totalReviews: json['total_reviews'] as int?,
      cuisineSpecialties: json['cuisine_specialties'] as String?,
      email: (json['email'] ?? userData?['email']) as String?,
      phone: (json['phone_number'] ?? json['phone']) as String?,
    );
  }

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();
}
