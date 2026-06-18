import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/rating/data/models/rating_model.dart';
import 'package:homemade_food_app/features/rating/data/repo/rating_repo.dart';
import 'package:homemade_food_app/features/order_details/data/models/order_details_model.dart';

class RatingRepoImp implements RatingRepo {
  final ApiService apiService;

  RatingRepoImp(this.apiService);

  @override
  Future<Either<Failure, void>> rateChef({
    required int chefId,
    required String token,
    required RatingModel ratingModel,
  }) async {
    try {
      await apiService.postData(
        endpoint: '/api/dishes/$chefId/reviews/',
        data: ratingModel.toJson(),
        token: token,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails({
    required String orderId,
    required String token,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: '/api/orders/$orderId/',
        token: token,
      );
      return right(OrderDetailsModel.fromJson(data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}