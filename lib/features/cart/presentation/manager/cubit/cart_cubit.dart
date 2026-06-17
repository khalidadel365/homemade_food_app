import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../data/models/order_request_model.dart';
import '../../../data/repos/cart_repo.dart';
import '../states/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.cartRepo) : super(CartInitialState());

  final CartRepo cartRepo;
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  String deliveryAddress = "Fetching location...";
  double deliveryLatitude = 0.0;
  double deliveryLongitude = 0.0;

  void updateOrderAddress({
    required String address,
    required double lat,
    required double lng,
  }) {
    deliveryAddress = address;
    deliveryLatitude = lat;
    deliveryLongitude = lng;
    emit(CartUpdatedState(List.from(cartItems)));
  }

  void addToCart(CartItemModel newItem) {
    final int? newChefId = newItem.dish.chef?.id;

    if (_cartItems.isNotEmpty && newChefId != null) {
      bool hasDifferentChef = _cartItems.any((item) =>
      item.dish.chef?.id != null && item.dish.chef!.id != newChefId);

      if (hasDifferentChef) {
        emit(CartChefConflictState('You cannot add items from different chefs to the same cart.'));
        return;
      }
    }

    int index = _cartItems.indexWhere((item) {
      final bool isSameDish = item.dish.id == newItem.dish.id;
      final bool isSameNotes = item.specialRequests == newItem.specialRequests;

      final Map<int, int?> currentOptionsIds = item.selectedVarieties.map((key, value) => MapEntry(key, value.id));
      final Map<int, int?> newOptionsIds = newItem.selectedVarieties.map((key, value) => MapEntry(key, value.id));

      final bool isSameOptions = const MapEquality().equals(currentOptionsIds, newOptionsIds);

      return isSameDish && isSameOptions && isSameNotes;
    });

    if (index != -1) {
      _cartItems[index].quantity = _cartItems[index].quantity + newItem.quantity;
    } else {
      _cartItems.add(newItem);
    }

    print('================ 🛒 CART CHECK 🛒 ================');
    print('Dish Name: ${newItem.dish.name} (ID: ${newItem.dish.id})');
    print('Quantity: ${newItem.quantity}');
    print('Selected Varieties:');
    if (newItem.selectedVarieties.isEmpty) {
      print('  -> No varieties selected.');
    } else {
      newItem.selectedVarieties.forEach((sectionId, option) {
        print('  -> [Section ID: $sectionId] Option: ${option.name} (Option ID: $option.id}) Extra Price: ${option.priceAdjustment}');
      });
    }
    print('Total Unit Price (with extras): ${newItem.unitPrice} EGP');
    print('==================================================');

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

  Future<void> createOrder({required String token, String specialInstructions = ""}) async {
    if (_cartItems.isEmpty) {
      emit(CreateOrderFailureState("Your cart is empty!"));
      return;
    }

    emit(CreateOrderLoadingState());

    final int chefId = _cartItems.first.dish.chef?.id ?? 0;

    final orderRequest = OrderRequestModel.fromCart(
      chefId: chefId,
      address: deliveryAddress,
      lat: deliveryLatitude,
      lng: deliveryLongitude,
      notes: specialInstructions,
      cartItems: _cartItems,
    );

    print("🚀 Request Body: ${orderRequest.toJson()}");

    var result = await cartRepo.createOrder(orderRequest: orderRequest, token: token);

    result.fold(
          (failure) {
        print("❌ API Error Detail: ${failure.errorMessage}");
        emit(CreateOrderFailureState(failure.errorMessage));
      },
          (orderResponse) {
        _cartItems.clear();
        emit(CreateOrderSuccessState(orderResponse));
      },
    );
  }
}