import '../../../data/models/cart_item_model.dart';
import '../../../data/models/order_reponse_model.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartUpdatedState extends CartStates {
  final List<CartItemModel> cartItems;
  CartUpdatedState(this.cartItems);
}

class CartChefConflictState extends CartStates {
  final String errorMessage;
  CartChefConflictState(this.errorMessage);
}

class CreateOrderLoadingState extends CartStates {}

class CreateOrderSuccessState extends CartStates {
  final OrderResponseModel orderResponse;
  CreateOrderSuccessState(this.orderResponse);
}

class CreateOrderFailureState extends CartStates {
  final String errMessage;
  CreateOrderFailureState(this.errMessage);
}