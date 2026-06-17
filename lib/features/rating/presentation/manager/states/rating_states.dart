import '../../../../order_details/data/models/order_details_model.dart';

abstract class RatingState {}

class RatingInitial extends RatingState {}

class GetOrderDetailsLoading extends RatingState {}

class GetOrderDetailsSuccess extends RatingState {
  final OrderDetailsModel orderDetails;
  GetOrderDetailsSuccess(this.orderDetails);
}

class GetOrderDetailsError extends RatingState {
  final String errMessage;
  GetOrderDetailsError(this.errMessage);
}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {}

class RatingError extends RatingState {
  final String errMessage;
  RatingError(this.errMessage);
}