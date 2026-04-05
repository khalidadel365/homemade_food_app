import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo.dart';

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

  Future<void> fetchAllDishes({String? category, String? search}) async {
    emit(FetchAllDishesLoading());

    int? min = int.tryParse(minPriceController.text.trim());
    int? max = int.tryParse(maxPriceController.text.trim());

    var result = await allDishesRepo.fetchAllDishes(
      category: category,
      search: search,
      minPrice: min,
      maxPrice: max,
      isAvailable: isAvailable,
    );

    result.fold(
      (failure) => emit(FetchAllDishesFailure(failure.errorMessage)),
      (dishes) => emit(FetchAllDishesSuccess(dishes)),
    );
  }

  void resetFilters() {
    minPriceController.clear();
    maxPriceController.clear();
    isAvailable = true;
    emit(FilterChangedState());
  }

  @override
  Future<void> close() {
    minPriceController.dispose();
    maxPriceController.dispose();
    return super.close();
  }
}
