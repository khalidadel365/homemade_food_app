import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo.dart';
import '../states/all_dishes_states.dart';

class FetchAllDishesCubit extends Cubit<FetchAllDishesState> {
  FetchAllDishesCubit(this.allDishesRepo) : super(FetchAllDishesInitial());
  final AllDishesRepo allDishesRepo;

  Future<void> fetchAllDishes({String? category}) async {
    emit(FetchAllDishesLoading());
    var result = await allDishesRepo.fetchAllDishes(category: category);
    result.fold((failure) {
      emit(FetchAllDishesFailure(failure.errorMessage));
    }, (dishes) {
      emit(FetchAllDishesSuccess(dishes));
    });
  }
}
