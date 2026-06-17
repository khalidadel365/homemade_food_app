import 'cart_item_model.dart';

class OrderRequestModel {
  final int chefId;
  final String address;
  final double lat;
  final double lng;
  final String notes;
  final List<CartItemModel> cartItems;

  OrderRequestModel({
    required this.chefId,
    required this.address,
    required this.lat,
    required this.lng,
    required this.notes,
    required this.cartItems,
  });

  factory OrderRequestModel.fromCart({
    required int chefId,
    required String address,
    required double lat,
    required double lng,
    required String notes,
    required List<CartItemModel> cartItems,
  }) {
    return OrderRequestModel(
      chefId: chefId,
      address: address,
      lat: lat,
      lng: lng,
      notes: notes,
      cartItems: cartItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "chef_id": chefId,
      "delivery_address": address,
      "delivery_longitude": lng,
      "delivery_latitude": lat,
      "special_instructions": notes,
      "items": cartItems.map((item) => {
        "dish_id": item.dish.id,
        "quantity": item.quantity,
        "special_requests": item.specialRequests ?? "",
        "variety_selections": item.selectedVarieties.entries.map((entry) => {
          "section_id": entry.key,
          "option_id": entry.value.id
        }).toList(),
      }).toList(),
    };
  }
}