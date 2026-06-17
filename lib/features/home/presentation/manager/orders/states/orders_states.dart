import 'package:meta/meta.dart';
import '../../../../data/models/order_requested_model.dart';
import '../../../../data/models/order_socket_model.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSocketConnected extends OrdersState {}

class NewIncomingOrderSuccess extends OrdersState {
  final OrderSocketModel order;
  NewIncomingOrderSuccess(this.order);
}

class PreparingSuccess extends OrdersState {
  final OrderSocketModel order;
  PreparingSuccess(this.order);
}

class OutForDeliverySuccess extends OrdersState {
  final OrderSocketModel order;
  OutForDeliverySuccess(this.order);
}

class OrderDeliveredSuccess extends OrdersState {
  final OrderSocketModel order;
  OrderDeliveredSuccess(this.order);
}

class OrderCanceledSuccess extends OrdersState {
  final OrderSocketModel order;
  OrderCanceledSuccess(this.order);
}


class OrdersError extends OrdersState {
  final String errMessage;
  OrdersError(this.errMessage);
}

class GetIncomingOrdersLoadingState extends OrdersState {}

class GetIncomingOrdersSuccessState extends OrdersState {
  final List<OrderRequestedModel> orders;
  GetIncomingOrdersSuccessState(this.orders);
}

class GetIncomingOrdersErrorState extends OrdersState {
  final String error;
  GetIncomingOrdersErrorState(this.error);
}

class GetPreparingOrdersLoadingState extends OrdersState {}

class GetPreparingOrdersSuccessState extends OrdersState {
  final List<OrderRequestedModel> orders;
  GetPreparingOrdersSuccessState(this.orders);
}

class GetPreparingOrdersErrorState extends OrdersState {
  final String error;
  GetPreparingOrdersErrorState(this.error);
}