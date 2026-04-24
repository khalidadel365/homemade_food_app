import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/profile_model.dart';
import '../../../data/repo/explore_all_chefs_repo.dart';
import '../states/explore_all_chefs_states.dart';

class ExploreAllChefsCubit extends Cubit<ExploreAllChefsState> {
  ExploreAllChefsCubit(this.exploreRepo) : super(ExploreAllChefsInitial());

  final ExploreAllChefsRepo exploreRepo;

  int currentPage = 1;
  bool hasReachedMax = false;
  List<ProfileModel> allChefs = [];
  bool isPaginationLoading = false;

  Future<void> fetchAllChefs({bool isFromPagination = false}) async {
    if (isPaginationLoading || (hasReachedMax && isFromPagination)) return;

    if (!isFromPagination) {
      resetPagination();
      emit(ExploreAllChefsLoading());
    }

    isPaginationLoading = true;

    var result = await exploreRepo.fetchAllChefs(
      page: currentPage,
      pageSize: 10,
    );

    result.fold(
      (failure) {
        isPaginationLoading = false;
        emit(ExploreAllChefsFailure(failure.errorMessage));
      },
      (exploreChefModel) {
        isPaginationLoading = false;

        final newChefs = exploreChefModel.results ?? [];

        if (newChefs.isEmpty) {
          hasReachedMax = true;
          emit(ExploreAllChefsSuccess(
            chefs: allChefs,
            hasReachedMax: true,
            currentPage: currentPage,
          ));
        } else {
          allChefs.addAll(newChefs);

          hasReachedMax = exploreChefModel.next == null;

          emit(ExploreAllChefsSuccess(
            chefs: List.from(allChefs),
            hasReachedMax: hasReachedMax,
            currentPage: currentPage,
          ));

          currentPage++;
        }
      },
    );
  }

  void resetPagination() {
    currentPage = 1;
    hasReachedMax = false;
    allChefs.clear();
  }
}
