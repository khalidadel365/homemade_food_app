import '../../../../../core/models/dish_model.dart';

abstract class FetchDishDetailsState {}

class FetchDishDetailsInitialState extends FetchDishDetailsState {}

class FetchDishDetailsLoadingState extends FetchDishDetailsState {}

class FetchDishDetailsFailureState extends FetchDishDetailsState {
  final String errMessage;

  FetchDishDetailsFailureState(this.errMessage);
}

class FetchDishDetailsSuccessState extends FetchDishDetailsState {
  final DishModel dish;

  FetchDishDetailsSuccessState(this.dish);
}
