import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/chef_model.dart';

abstract class ExploreAllChefsRepo {
  Future<Either<Failure, ExploreChefModel>> fetchAllChefs({
    required int page,
    required int pageSize,
  });
}
