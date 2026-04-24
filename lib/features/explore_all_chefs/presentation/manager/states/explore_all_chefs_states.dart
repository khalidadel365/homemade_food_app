import '../../../../../core/models/profile_model.dart';

abstract class ExploreAllChefsState {}

class ExploreAllChefsInitial extends ExploreAllChefsState {}

class ExploreAllChefsLoading extends ExploreAllChefsState {}

class ExploreAllChefsFailure extends ExploreAllChefsState {
  final String errMessage;

  ExploreAllChefsFailure(this.errMessage);
}

class ExploreAllChefsSuccess extends ExploreAllChefsState {
  final List<ProfileModel> chefs;
  final bool hasReachedMax;
  final int currentPage;

  ExploreAllChefsSuccess({
    required this.chefs,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
}

class ChefFilterChangedState extends ExploreAllChefsState {}
