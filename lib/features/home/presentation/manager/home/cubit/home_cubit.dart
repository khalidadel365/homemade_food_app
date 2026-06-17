import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';
import 'package:homemade_food_app/features/home/presentation/manager/home/states/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(FetchConsumerHomePageInitial());

  final HomeRepo homeRepo;

  Future<void> fetchConsumerHomePage() async {
    emit(FetchConsumerHomePageLoading());

    var result = await homeRepo.fetchConsumerHomePage();

    result.fold(
      (failure) {
        emit(FetchConsumerHomePageFailure(failure.errorMessage));
      },
      (homeModel) {
        emit(FetchConsumerHomePageSuccess(homeModel));
      },
    );
  }
}
