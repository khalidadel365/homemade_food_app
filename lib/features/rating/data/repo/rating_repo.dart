// lib/features/rating/data/repo/rating_repo.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../order_details/data/models/order_details_model.dart';
import '../models/rating_model.dart';

abstract class RatingRepo {
  Future<Either<Failure, void>> rateChef({
    required int chefId,
    required String token,
    required RatingModel ratingModel,
  });

  Future<Either<Failure, OrderDetailsModel>> getOrderDetails({
    required String orderId,
    required String token,
  });
}