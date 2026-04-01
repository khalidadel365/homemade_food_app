import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/models/dish_model.dart';

abstract class AllDishesRepo {
  Future<Either<Failure, List<DishModel>>> fetchAllDishes({String? category});
}
