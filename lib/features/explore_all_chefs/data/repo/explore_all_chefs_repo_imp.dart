import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/models/cheif_model.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/explore_all_chefs/data/repo/explore_all_chefs_repo.dart';

class ExploreAllChefsRepoImp implements ExploreAllChefsRepo {
  final ApiService apiService;

  ExploreAllChefsRepoImp(this.apiService);

  @override
  Future<Either<Failure, ChefModel>> fetchAllChefs({
    required int page,
    required int pageSize,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: '/api/auth/chefs/',
        queryParameters: {
          'page': page,
          'page_size': pageSize,
        },
      );

      ChefModel chefModel = ChefModel.fromJson(data);

      return right(chefModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure('Something went wrong please try again later'));
    }
  }
}
