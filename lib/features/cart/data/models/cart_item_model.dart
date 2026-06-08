import '../../../../core/models/dish_model.dart';
import '../../../dish_details/data/models/options_model.dart';

class CartItemModel {
  final DishModel dish;
  final OptionsModel? selectedOption;
  int quantity;

  CartItemModel({
    required this.dish,
    this.selectedOption,
    this.quantity = 1,
  });

  double get unitPrice {
    double basePrice = double.tryParse(dish.price ?? '0') ?? 0.0;
    double adjustment = 0.0;

    if (selectedOption != null && selectedOption!.priceAdjustment != null) {
      adjustment = double.tryParse(selectedOption!.priceAdjustment!) ?? 0.0;
    }

    return basePrice + adjustment;
  }

  double get totalPrice => unitPrice * quantity;
}
