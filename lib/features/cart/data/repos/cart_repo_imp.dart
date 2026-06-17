import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utilities/api_service.dart';
import '../models/order_reponse_model.dart';
import '../models/order_request_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;

  CartRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, OrderResponseModel>> createOrder({
    required OrderRequestModel orderRequest,
    required String token,
  }) async {
    try {
      print(token);
      final dynamic responseData = await apiService.postData(
        endpoint: '/api/orders/create/',
        data: orderRequest.toJson(),
        token: token,
      );

      final orderResponse = OrderResponseModel.fromJson(responseData);

      return right(orderResponse);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}