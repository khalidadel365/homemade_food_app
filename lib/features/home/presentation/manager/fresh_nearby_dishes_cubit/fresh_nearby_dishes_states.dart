import '../../../data/models/dish_model.dart';

abstract class FreshNearbyDishesState {}

class FreshNearbyDishesInitial extends FreshNearbyDishesState {}
class FreshNearbyDishesLoading extends FreshNearbyDishesState {}
class FreshNearbyDishesFailure extends FreshNearbyDishesState {
  final String errMessage;
  FreshNearbyDishesFailure(this.errMessage);
}
class FreshNearbyDishesSuccess extends FreshNearbyDishesState {
  final List<DishModel> dishes;
  FreshNearbyDishesSuccess(this.dishes);
}