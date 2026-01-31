import 'package:dartz/dartz.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<DishModel>>> fetchDishes({String? category});
}
