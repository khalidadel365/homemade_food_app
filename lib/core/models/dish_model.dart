import '../../features/all_dishes/data/models/category_model.dart';
import 'cheif_model.dart';

class DishModel {
  final int? id;
  final String? name;
  final String? price;
  final bool? isAvailable;
  final int? preparationTime;
  final ChefModel? chef;
  final CategoryModel? category;
  final String? createdAt;
  final double? averageRating;
  final String? imageUrl;

  DishModel({
    this.id,
    this.name,
    this.price,
    this.isAvailable,
    this.preparationTime,
    this.chef,
    this.category,
    this.createdAt,
    this.averageRating,
    this.imageUrl,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      isAvailable: json['is_available'] as bool?,
      preparationTime: json['preparation_time'] as int?,
      chef: json['chef'] != null
          ? ChefModel.fromJson(json['chef'] as Map<String, dynamic>)
          : null,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] as String?,
      imageUrl: json['image'] as String?,
      averageRating: json['average_rating'] != null
          ? (json['average_rating'] as num).toDouble()
          : null,
    );
  }
}
