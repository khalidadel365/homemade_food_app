import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/states/dish_details_states.dart';

class FetchDishDetailsCubit extends Cubit<FetchDishDetailsState> {
  FetchDishDetailsCubit(this.dishDetailsRepo)
      : super(FetchDishDetailsInitialState());

  final DishDetailsRepo dishDetailsRepo;

  dynamic selectedOption;
  int quantity = 1;

  Future<void> fetchDishDetails({required int id}) async {
    emit(FetchDishDetailsLoadingState());
    var result = await dishDetailsRepo.fetchDishDetails(dishId: id);
    result.fold((failure) {
      emit(FetchDishDetailsFailureState(failure.errorMessage));
    }, (dish) {
      quantity = 1;
      emit(FetchDishDetailsSuccessState(dish));
    });
  }

  void updateSelection(dynamic option) {
    selectedOption = option;
  }

  void updateQuantity(int newQuantity) {
    if (newQuantity >= 1) {
      quantity = newQuantity;
      if (state is FetchDishDetailsSuccessState) {
        emit(FetchDishDetailsSuccessState((state as FetchDishDetailsSuccessState).dish));
      }
    }
  }

  double calculateTotalPrice(String basePrice) {
    double total = double.tryParse(basePrice) ?? 0.0;
    if (selectedOption != null) {
      total +=
          double.tryParse(selectedOption.priceAdjustment.toString()) ?? 0.0;
    }
    return total * quantity;
  }
}