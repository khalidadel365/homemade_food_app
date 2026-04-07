import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/home/data/models/home_model.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);

  @override
  Future<Either<Failure, HomeModel>> fetchConsumerHomePage() async {
    try {
      var data = await apiService.get(
        endPoint: '/api/dishes/home/',
      );

      HomeModel homeData = HomeModel.fromJson(data);

      return right(homeData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
