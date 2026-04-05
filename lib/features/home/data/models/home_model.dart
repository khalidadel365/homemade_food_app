import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final List<Category>? categories;
  final List<FeaturedDish>? featuredDishes;
  final List<TopChef>? topChefs;
  final List<NewDish>? newDishes;

  HomeModel({
    this.categories,
    this.featuredDishes,
    this.topChefs,
    this.newDishes,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        featuredDishes: json["featured_dishes"] == null
            ? []
            : List<FeaturedDish>.from(
                json["featured_dishes"]!.map((x) => FeaturedDish.fromJson(x))),
        topChefs: json["top_chefs"] == null
            ? []
            : List<TopChef>.from(
                json["top_chefs"]!.map((x) => TopChef.fromJson(x))),
        newDishes: json["new_dishes"] == null
            ? []
            : List<NewDish>.from(
                json["new_dishes"]!.map((x) => NewDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "featured_dishes": featuredDishes == null
            ? []
            : List<dynamic>.from(featuredDishes!.map((x) => x.toJson())),
        "top_chefs": topChefs == null
            ? []
            : List<dynamic>.from(topChefs!.map((x) => x.toJson())),
        "new_dishes": newDishes == null
            ? []
            : List<dynamic>.from(newDishes!.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class FeaturedDish {
  final int? id;
  final String? name;
  final String? price;
  final bool? isAvailable;
  final int? preparationTime;
  final Chef? chef;
  final Category? category;
  final DateTime? createdAt;
  final double? averageRating;
  final String? image;
  final String? description;

  FeaturedDish({
    this.id,
    this.name,
    this.price,
    this.isAvailable,
    this.preparationTime,
    this.chef,
    this.category,
    this.createdAt,
    this.averageRating,
    this.image,
    this.description,
  });

  factory FeaturedDish.fromJson(Map<String, dynamic> json) => FeaturedDish(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        isAvailable: json["is_available"],
        preparationTime: json["preparation_time"],
        chef: json["chef"] == null ? null : Chef.fromJson(json["chef"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        averageRating: json["average_rating"]?.toDouble(),
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "is_available": isAvailable,
        "preparation_time": preparationTime,
        "chef": chef?.toJson(),
        "category": category?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "average_rating": averageRating,
        "image": image,
        "description": description,
      };
}

class Chef {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;

  Chef({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePicture,
  });

  factory Chef.fromJson(Map<String, dynamic> json) => Chef(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_picture": profilePicture,
      };
}

class NewDish {
  final int? id;
  final String? name;
  final String? price;
  final String? chefName;
  final dynamic image;
  final DateTime? createdAt;

  NewDish({
    this.id,
    this.name,
    this.price,
    this.chefName,
    this.image,
    this.createdAt,
  });

  factory NewDish.fromJson(Map<String, dynamic> json) => NewDish(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        chefName: json["chef_name"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "chef_name": chefName,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
      };
}

class TopChef {
  final int? id;
  final Chef? user;
  final String? rating;
  final int? totalReviews;
  final String? cuisineSpecialties;

  TopChef({
    this.id,
    this.user,
    this.rating,
    this.totalReviews,
    this.cuisineSpecialties,
  });

  factory TopChef.fromJson(Map<String, dynamic> json) => TopChef(
        id: json["id"],
        user: json["user"] == null ? null : Chef.fromJson(json["user"]),
        rating: json["rating"],
        totalReviews: json["total_reviews"],
        cuisineSpecialties: json["cuisine_specialties"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "rating": rating,
        "total_reviews": totalReviews,
        "cuisine_specialties": cuisineSpecialties,
      };
}
