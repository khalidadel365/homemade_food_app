import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo.dart';

import '../../../../../core/models/dish_model.dart';
import '../states/all_dishes_states.dart';

class FetchAllDishesCubit extends Cubit<FetchAllDishesState> {
  FetchAllDishesCubit(this.allDishesRepo) : super(FetchAllDishesInitial());

  final AllDishesRepo allDishesRepo;
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  bool isAvailable = true;

  void changeAvailability(bool value) {
    isAvailable = value;
    emit(FilterChangedState());
  }

  int currentPage = 1;
  bool hasReachedMax = false;
  List<DishModel> allDishes = [];

  Future<void> fetchAllDishes({String? category, String? search}) async {
    if (hasReachedMax && currentPage != 1) return;

    if (currentPage == 1) {
      allDishes.clear();
      hasReachedMax = false;
      emit(FetchAllDishesLoading());
    }

    int? min = int.tryParse(minPriceController.text.trim());
    int? max = int.tryParse(maxPriceController.text.trim());

    var result = await allDishesRepo.fetchAllDishes(
      page: currentPage,
      limit: 5,
      category: category,
      search: search,
      minPrice: min,
      maxPrice: max,
      isAvailable: isAvailable,
    );

    result.fold(
      (failure) => emit(FetchAllDishesFailure(failure.errorMessage)),
      (newDishes) {
        if (newDishes.isEmpty) {
          hasReachedMax = true; // to prevent API calls again if he scrolls the first condition (hasReachedMax) will stop the API call
          emit(FetchAllDishesSuccess(dishes: allDishes, hasReachedMax: true));
        } else {
          allDishes.addAll(newDishes);
          currentPage++;

          emit(FetchAllDishesSuccess(
            //change the reference of the list to trigger the UI update
            // because if we are adding to the same list bloc won't emit a new state because the reference of the list is the same
            dishes: List.from(allDishes),
            hasReachedMax: false,
          ));
        }
      },
    );
  }

  // Call this method when the user changes the filters to reset pagination and fetch dishes again
  void resetPagination() {
    currentPage = 1;
    hasReachedMax = false;
    allDishes.clear();
  }

  void resetFilters() {
    minPriceController.clear();
    maxPriceController.clear();
    isAvailable = true;
    resetPagination();
    emit(FilterChangedState());
  }

  @override
  Future<void> close() {
    minPriceController.dispose();
    maxPriceController.dispose();
    return super.close();
  }
}
