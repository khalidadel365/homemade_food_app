import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);

  @override
  @override
  Future<Either<Failure, List<DishModel>>> fetchDishes({String? category}) async {
    try {
      var data = await apiService.get(
        endPoint: '/api/dishes/',
        queryParameters: (category != null && category != 'All')
            ? {'category_name': category}
            : null,
      );

      List<DishModel> dishes = [];
      for (var item in data['results']) {
        try {
          dishes.add(DishModel.fromJson(item));
        } catch (e) {
          print(e.toString());
        }
      }
      return right(dishes);

    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  }
