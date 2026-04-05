import '../../../../../core/models/dish_model.dart';

abstract class FetchAllDishesState {}

class FetchAllDishesInitial extends FetchAllDishesState {}

class FetchAllDishesLoading extends FetchAllDishesState {}

class FetchAllDishesFailure extends FetchAllDishesState {
  final String errMessage;

  FetchAllDishesFailure(this.errMessage);
}

class FetchAllDishesSuccess extends FetchAllDishesState {
  final List<DishModel> dishes;

  FetchAllDishesSuccess(this.dishes);
}
class FilterChangedState extends FetchAllDishesState{}