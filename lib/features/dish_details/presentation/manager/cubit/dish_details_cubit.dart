import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/states/dish_details_states.dart';

import '../../../data/models/options_model.dart';

class FetchDishDetailsCubit extends Cubit<FetchDishDetailsState> {
  FetchDishDetailsCubit(this.dishDetailsRepo) : super(FetchDishDetailsInitialState());

  final DishDetailsRepo dishDetailsRepo;

  Map<int, OptionsModel> selectedVarietiesMap = {};
  int quantity = 1;

  Future<void> fetchDishDetails({required int id}) async {
    emit(FetchDishDetailsLoadingState());
    var result = await dishDetailsRepo.fetchDishDetails(dishId: id);
    result.fold((failure) {
      emit(FetchDishDetailsFailureState(failure.errorMessage));
    }, (dish) {
      quantity = 1;
      selectedVarietiesMap.clear();
      emit(FetchDishDetailsSuccessState(dish));
    });
  }

  void updateSectionSelection({required int sectionId, required OptionsModel option}) {
    selectedVarietiesMap[sectionId] = option;

    if (state is FetchDishDetailsSuccessState) {
      emit(FetchDishDetailsSuccessState((state as FetchDishDetailsSuccessState).dish));
    }
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

    selectedVarietiesMap.forEach((sectionId, option) {
      if (option.priceAdjustment != null) {
        total += double.tryParse(option.priceAdjustment.toString()) ?? 0.0;
      }
    });

    return total * quantity;
  }
}