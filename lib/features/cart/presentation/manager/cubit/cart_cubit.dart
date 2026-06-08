import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_item_model.dart';
import '../states/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addToCart(CartItemModel newItem) {
    // make sure all items in the cart are from the same chef
    final int? newChefId = newItem.dish.chef?.id;

    if (_cartItems.isNotEmpty && newChefId != null) {
      // check if there's any item in the cart that belongs to a different chef
      bool hasDifferentChef = _cartItems.any((item) =>
      item.dish.chef?.id != null && item.dish.chef!.id != newChefId);

      if (hasDifferentChef) {
        emit(CartChefConflictState('You cannot add items from different chefs to the same cart.'));
        return;
      }
    }

    int index = _cartItems.indexWhere((item) {
      final bool isSameDish = item.dish.id == newItem.dish.id;

      final dynamic currentOptId = item.selectedOption?.id;
      final dynamic newOptId = newItem.selectedOption?.id;

      final bool isSameOption = currentOptId == newOptId;

      return isSameDish && isSameOption;
    });

    if (index != -1) {
      print("🎯 [CartCubit] Found item! Old Qty: ${_cartItems[index].quantity}, Adding: ${newItem.quantity}");

      _cartItems[index].quantity = _cartItems[index].quantity + newItem.quantity;

      print("🎯 [CartCubit] New Qty after total: ${_cartItems[index].quantity}");
    } else {
      print("🎯 [CartCubit] Item not found. Adding as new item with Qty: ${newItem.quantity}");
      _cartItems.add(newItem);
    }

    emit(CartUpdatedState(List.from(_cartItems)));
  }

  void updateQuantity(CartItemModel item, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(item);
    } else {
      item.quantity = newQuantity;
      emit(CartUpdatedState(List.from(_cartItems)));
    }
  }

  void removeFromCart(CartItemModel item) {
    _cartItems.remove(item);
    emit(CartUpdatedState(List.from(_cartItems)));
  }
}