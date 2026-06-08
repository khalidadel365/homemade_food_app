import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/cubit/dish_details_cubit.dart';

class DishDetailsBottomNavBar extends StatelessWidget {
  const DishDetailsBottomNavBar({
    super.key,
    required this.onAddToCart,
    required this.totalPrice,
  });

  final VoidCallback? onAddToCart;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<FetchDishDetailsCubit>();
    int currentCounter = cubit.quantity;

    return Container(
      width: double.infinity,
      height: 85,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 140,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(13)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentCounter > 1) {
                      cubit.updateQuantity(currentCounter - 1);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(Icons.remove, size: 20),
                  ),
                ),
                Expanded(
                  child: Text(
                    '$currentCounter',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () => cubit.updateQuantity(currentCounter + 1),
                  child: Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(Icons.add, size: 20),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: onAddToCart,
              child: Container(
                height: 53,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: Styles.textStyle15.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Text(
                        '${totalPrice.toStringAsFixed(1)} EGY',
                        style: Styles.textStyle14.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}