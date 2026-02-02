import 'package:flutter/material.dart';
import '../../../../../core/utilities/styles.dart';

class PaymentSummarySection extends StatelessWidget {
  const PaymentSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Subtotal', style: Styles.textStyle14),
            const Spacer(),
            Text('250 EGP', style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Delivery Fee', style: Styles.textStyle14),
            const Spacer(),
            Text('40 EGP', style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Service Fee', style: Styles.textStyle14),
            const Spacer(),
            Text('10 EGP', style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}