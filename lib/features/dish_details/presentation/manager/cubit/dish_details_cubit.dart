import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/states/dish_details_states.dart';

class FetchDishDetailsCubit extends Cubit<FetchDishDetailsState> {
  FetchDishDetailsCubit(this.dishDetailsRepo) : super(FetchDishDetailsInitialState());
  final DishDetailsRepo dishDetailsRepo;

  Future<void> fetchDishDetails({required int id}) async {
    emit(FetchDishDetailsLoadingState());
    var result = await dishDetailsRepo.fetchDishDetails(dishId: id);
    result.fold((failure) {
      emit(FetchDishDetailsFailureState(failure.errorMessage));
    }, (dish) {
      emit(FetchDishDetailsSuccessState(dish));
    });
  }
}
