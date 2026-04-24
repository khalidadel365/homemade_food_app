import '../../../../core/models/profile_model.dart';

class ExploreChefModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<ProfileModel>? results;

  ExploreChefModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ExploreChefModel.fromJson(Map<String, dynamic> json) {
    return ExploreChefModel(
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

  ExploreChefModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<ProfileModel>? results,
  }) {
    return ExploreChefModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
