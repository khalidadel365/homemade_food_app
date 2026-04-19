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
  final bool
      hasReachedMax; // to stop calling API when (api return empty list) we reach the end so don't call API again
  final int currentPage;

  FetchAllDishesSuccess({
    required this.dishes,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
}

class FilterChangedState extends FetchAllDishesState {}
