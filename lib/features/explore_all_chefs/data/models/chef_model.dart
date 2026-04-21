import '../../../../core/models/profile_model.dart';

class ChefModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<ProfileModel>? results;

  ChefModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) {
    return ChefModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: json['results'] != null
          ? (json['results'] as List)
              .map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  ChefModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<ProfileModel>? results,
  }) {
    return ChefModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
