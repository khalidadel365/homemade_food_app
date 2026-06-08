import '../../../data/models/cart_item_model.dart';

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
