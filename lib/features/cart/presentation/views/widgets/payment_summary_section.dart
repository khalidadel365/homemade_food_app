import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/cubit/cart_cubit.dart';
import '../../manager/states/cart_states.dart';

class PaymentSummarySection extends StatelessWidget {
  const PaymentSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();

        double subtotal = cubit.cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

        double deliveryFee = cubit.cartItems.isEmpty ? 0.0 : 40.0;
        double serviceFee = cubit.cartItems.isEmpty ? 0.0 : 10.0;

        return Column(
          children: [
            Row(
              children: [
                Text('Subtotal', style: Styles.textStyle14),
                const Spacer(),
                Text('${subtotal.toStringAsFixed(0)} EGP',
                    style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Delivery Fee', style: Styles.textStyle14),
                const Spacer(),
                Text('${deliveryFee.toStringAsFixed(0)} EGP',
                    style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Service Fee', style: Styles.textStyle14),
                const Spacer(),
                Text('${serviceFee.toStringAsFixed(0)} EGP',
                    style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        );
      },
    );
  }
}