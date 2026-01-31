import 'category_model.dart';
import 'cheif_model.dart';

class DishModel {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final bool? isAvailable;
  final int? preparationTime;
  final ChefModel? chef;
  final CategoryModel? category;
  final String? createdAt;
  final String? updatedAt;
  final double? averageRating;

  DishModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.isAvailable,
    this.preparationTime,
    this.chef,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.averageRating,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      isAvailable: json['is_available'],
      preparationTime: json['preparation_time'],
      chef: json['chef'] != null ? ChefModel.fromJson(json['chef']) : null,
      category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      averageRating: json['average_rating'] != null ? (json['average_rating'] as num).toDouble() : 0.0,
    );
  }
}