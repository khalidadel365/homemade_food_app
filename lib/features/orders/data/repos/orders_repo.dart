import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/orders_model.dart';

abstract interface class OrderRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders({
    required String token,
  });
}