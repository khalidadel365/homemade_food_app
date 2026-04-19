import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';

import '../../../../core/models/dish_model.dart';
import 'all_dishes_repo.dart';

class AllDishesRepoImp implements AllDishesRepo {
  final ApiService apiService;

  AllDishesRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<DishModel>>> fetchAllDishes({
    String? category,
    String? search,
    int? minPrice,
    int? maxPrice,
    bool? isAvailable,
    int? chefId,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {};

      if (category != null && category != 'All') {
        queryParameters['category_name'] = category;
      }
      if (search != null && search.isNotEmpty) {
        queryParameters['search'] = search;
      }
      if (minPrice != null) {
        queryParameters['min_price'] = minPrice;
      }
      if (maxPrice != null) {
        queryParameters['max_price'] = maxPrice;
      }
      if (isAvailable != null) {
        queryParameters['is_available'] = isAvailable;
      }
      if (chefId != null) {
        queryParameters['chef-id'] = chefId;
      }

      var data = await apiService.get(
        endPoint: '/api/dishes/',
        queryParameters: queryParameters.isEmpty ? null : queryParameters,
      );

      List<DishModel> dishes = [];
      if (data['results'] != null) {
        for (var item in data['results']) {
          try {
            dishes.add(DishModel.fromJson(item));
          } catch (e) {
            print('error parsing dishes: $e');
          }
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
