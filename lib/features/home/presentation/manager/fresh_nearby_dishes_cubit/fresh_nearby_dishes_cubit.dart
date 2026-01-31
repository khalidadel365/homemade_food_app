import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';

import 'fresh_nearby_dishes_states.dart';

class FreshNearbyDishesCubit extends Cubit<FreshNearbyDishesState> {
FreshNearbyDishesCubit(this.homeRepo) : super(FreshNearbyDishesInitial());
final HomeRepo homeRepo;
Future<void> fetchFreshNearbyDishes({String? category}) async {
  emit(FreshNearbyDishesLoading());
  var result =await homeRepo.fetchDishes(category: category);
  result.fold((failure){
  emit(FreshNearbyDishesFailure(failure.errorMessage));
  }, (dishes){
    emit(FreshNearbyDishesSuccess(dishes));
  });
}
}