import 'package:dartz/dartz.dart';
import 'package:homemade_food_app/core/models/cheif_model.dart';

import '../../../../core/errors/failures.dart';

abstract class ExploreAllChefsRepo {
  Future<Either<Failure, List<ChefModel>>> fetchAllChefs({
    required int page,
    required int pageSize,
  });
}
