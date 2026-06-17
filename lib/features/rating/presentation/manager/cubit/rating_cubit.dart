// lib/features/rating/presentation/manager/rating_cubit.dart

import 'package:bloc/bloc.dart';

import '../../../data/models/rating_model.dart';
import '../../../data/repo/rating_repo.dart';
import '../states/rating_states.dart';

class RatingCubit extends Cubit<RatingState> {
  final RatingRepo ratingRepo;

  RatingCubit(this.ratingRepo) : super(RatingInitial());

  Future<void> getOrderDetails({
    required String orderId,
    required String token,
  }) async {
    emit(GetOrderDetailsLoading());

    var result = await ratingRepo.getOrderDetails(
      orderId: orderId,
      token: token,
    );

    result.fold(
          (failure) => emit(GetOrderDetailsError(failure.errorMessage)),
          (orderDetails) => emit(GetOrderDetailsSuccess(orderDetails)),
    );
  }

  Future<void> submitRating({
    required int chefId,
    required String token,
    required int rating,
    required String reviewText,
  }) async {
    emit(RatingLoading());

    var ratingModel = RatingModel(
      rating: rating,
      reviewText: reviewText,
    );

    var result = await ratingRepo.rateChef(
      chefId: chefId,
      token: token,
      ratingModel: ratingModel,
    );

    result.fold(
          (failure) => emit(RatingError(failure.errorMessage)),
          (_) => emit(RatingSuccess()),
    );
  }
}