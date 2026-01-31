class CategoryModel {
  final int? id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final int? dishCount;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.dishCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      dishCount: json['dish_count'],
    );
  }
}