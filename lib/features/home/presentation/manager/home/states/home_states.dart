import 'package:homemade_food_app/features/home/data/models/home_model.dart';

abstract class HomeStates {}

class FetchConsumerHomePageInitial extends HomeStates {}

class FetchConsumerHomePageLoading extends HomeStates {}

class FetchConsumerHomePageFailure extends HomeStates {
  final String errMessage;

  FetchConsumerHomePageFailure(this.errMessage);
}

class FetchConsumerHomePageSuccess extends HomeStates {
  final HomeModel homeModel;

  FetchConsumerHomePageSuccess(this.homeModel);
}
