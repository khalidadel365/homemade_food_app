import '../../../data/models/orders_model.dart';

abstract class OrdersStates {}

class FetchOrdersInitial extends OrdersStates {}

class FetchOrdersLoading extends OrdersStates {}

class FetchOrdersFailure extends OrdersStates {
  final String errMessage;

  FetchOrdersFailure(this.errMessage);
}

class FetchOrdersSuccess extends OrdersStates {
  final List<OrderModel> orders;

  FetchOrdersSuccess(this.orders);
}