import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/order_reponse_model.dart';
import '../models/order_request_model.dart';

abstract class CartRepo {
  Future<Either<Failure, OrderResponseModel>> createOrder({
    required OrderRequestModel orderRequest,
    required String token,
  });
}