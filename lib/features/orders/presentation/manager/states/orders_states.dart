import 'package:meta/meta.dart';
import '../../../../home/data/models/order_requested_model.dart';
import '../../../../home/data/models/order_socket_model.dart';
import '../../../data/models/orders_model.dart';

@immutable
abstract class OrdersStates {}

class OrdersInitial extends OrdersStates {}
class OrdersLoading extends OrdersStates {}
class FetchOrdersLoading extends OrdersStates {}
class FetchOrdersInitial extends OrdersStates {}

class FetchOrdersFailure extends OrdersStates {
  final String errMessage;
  FetchOrdersFailure(this.errMessage);
}

class FetchOrdersSuccess extends OrdersStates {
  final List<OrderModel> orders;
  FetchOrdersSuccess(this.orders);
}

class NewIncomingOrderSuccess extends OrdersStates {
  final OrderSocketModel order;
  NewIncomingOrderSuccess(this.order);
}

class PreparingSuccess extends OrdersStates {
  final OrderSocketModel order;
  PreparingSuccess(this.order);
}

class OutForDeliverySuccess extends OrdersStates {
  final OrderSocketModel order;
  OutForDeliverySuccess(this.order);
}

class OrderDeliveredSuccess extends OrdersStates {
  final OrderSocketModel order;
  OrderDeliveredSuccess(this.order);
}

class OrderCanceledSuccess extends OrdersStates {
  final OrderSocketModel order;
  OrderCanceledSuccess(this.order);
}

// --- حالات إضافية ---
class GetIncomingOrdersLoadingState extends OrdersStates {}
class GetIncomingOrdersSuccessState extends OrdersStates {
  final List<OrderRequestedModel> orders;
  GetIncomingOrdersSuccessState(this.orders);
}

class GetIncomingOrdersErrorState extends OrdersStates {
  final String error;
  GetIncomingOrdersErrorState(this.error);
}