import 'package:dartz/dartz.dart';
import 'package:homemade_food_app/features/home/data/models/home_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> fetchConsumerHomePage();

  void initOrdersSocket({required String token});

  Stream<dynamic> listenToOrders();

  void closeSocket();

}
