import '../../../data/models/order_details_model.dart';

abstract class OrderDetailsStates {}

class OrderDetailsInitialState extends OrderDetailsStates {}

class OrderDetailsLoadingState extends OrderDetailsStates {}

class OrderDetailsSuccessState extends OrderDetailsStates {
  final OrderDetailsModel order;
  OrderDetailsSuccessState(this.order);
}

class OrderDetailsFailureState extends OrderDetailsStates {
  final String errorMessage;
  OrderDetailsFailureState(this.errorMessage);
}