import '../../../../core/models/dish_model.dart';
import '../../../dish_details/data/models/options_model.dart';

class CartItemModel {
  final DishModel dish;
  int quantity;
  final String? specialRequests;
  final Map<int, OptionsModel> selectedVarieties;

  CartItemModel({
    required this.dish,
    required this.selectedVarieties,
    this.quantity = 1,
    this.specialRequests,
  });

  double get unitPrice {
    double basePrice = double.tryParse(dish.price ?? '0') ?? 0.0;
    double adjustments = 0.0;

    selectedVarieties.forEach((sectionId, option) {
      if (option.priceAdjustment != null) {
        adjustments += double.tryParse(option.priceAdjustment!) ?? 0.0;
      }
    });

    return basePrice + adjustments;
  }

  double get totalPrice => unitPrice * quantity;
}