import 'dart:convert';

import 'package:homemade_food_app/core/models/cheif_model.dart';
import 'package:homemade_food_app/core/models/dish_model.dart';
import 'package:homemade_food_app/features/all_dishes/data/models/category_model.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

class HomeModel {
  final List<CategoryModel>? categories;
  final List<DishModel>? featuredDishes;
  final List<ChefModel>? topChefs;
  final List<DishModel>? newArrivalsDishes;

  HomeModel({
    this.categories,
    this.featuredDishes,
    this.topChefs,
    this.newArrivalsDishes,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      categories: json["categories"] == null
          ? []
          : List<CategoryModel>.from(json["categories"]
              .map((x) => CategoryModel.fromJson(x as Map<String, dynamic>))),
      featuredDishes: json["featured_dishes"] == null
          ? []
          : List<DishModel>.from(json["featured_dishes"]
              .map((x) => DishModel.fromJson(x as Map<String, dynamic>))),
      topChefs: json["top_chefs"] == null
          ? []
          : List<ChefModel>.from(json["top_chefs"]
              .map((x) => ChefModel.fromJson(x as Map<String, dynamic>))),
      newArrivalsDishes: json["new_dishes"] == null
          ? []
          : List<DishModel>.from(json["new_dishes"]
              .map((x) => DishModel.fromJson(x as Map<String, dynamic>))),
    );
  }
}
