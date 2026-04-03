import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/dish_model.dart';

abstract class DishDetailsRepo {
  Future<Either<Failure, DishModel>> fetchDishDetails({required int dishId});
}
