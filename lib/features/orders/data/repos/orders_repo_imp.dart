import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utilities/api_service.dart';
import '../models/orders_model.dart';
import 'orders_repo.dart';


class OrdersRepoImp implements OrderRepo {
  final ApiService apiService;

  OrdersRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders({
    required String token,
  }) async {
    try {
      final dynamic responseData = await apiService.get(
        endPoint: '/api/orders/',
        token: token,
      );

      List<OrderModel> orders = [];
      if (responseData is List) {
        orders = responseData.map((json) => OrderModel.fromJson(json)).toList();
      } else if (responseData is Map && responseData['data'] is List) {
        orders = (responseData['data'] as List).map((json) => OrderModel.fromJson(json)).toList();
      }

      return right(orders);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}