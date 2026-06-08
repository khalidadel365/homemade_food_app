import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/cubit/cart_cubit.dart';
import '../../manager/states/cart_states.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();

        double subtotal = cubit.cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

        double deliveryFee = cubit.cartItems.isEmpty ? 0.0 : 40.0;
        double serviceFee = cubit.cartItems.isEmpty ? 0.0 : 10.0;
        double total = subtotal + deliveryFee + serviceFee;

        bool isCartEmpty = cubit.cartItems.isEmpty;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
          child: GestureDetector(
            onTap: isCartEmpty
                ? null // معطل لو السلة فاضية
                : () {
              GoRouter.of(context).push(AppRouter.kCheckoutScreen);
            },
            child: Opacity(
              opacity: isCartEmpty ? 0.6 : 1.0, // شفافية بسيطة لو معطل
              child: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Text(
                      'Checkout',
                      style: Styles.textStyle17.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Text(
                        '${total.toStringAsFixed(0)} EGP',
                        style: Styles.textStyle14.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}