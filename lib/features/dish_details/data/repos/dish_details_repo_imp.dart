import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo.dart';
import '../../../../core/models/dish_model.dart';

class DishDetailsRepoImp implements DishDetailsRepo {
  final ApiService apiService;

  DishDetailsRepoImp(this.apiService);

  @override
  Future<Either<Failure, DishModel>> fetchDishDetails(
      {required int dishId}) async {
    try {
      var data = await apiService.get(
        endPoint: '/api/dishes/$dishId/',
      );
      DishModel dish = DishModel.fromJson(data);
      return right(dish);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
