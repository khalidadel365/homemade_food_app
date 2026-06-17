import 'package:flutter/material.dart';

import '../../../data/models/order_details_model.dart';

class PriceSummaryWidget extends StatelessWidget {
  final OrderDetailsModel order;
  const PriceSummaryWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', '${order.subtotal} EGP', isBold: false),
          const SizedBox(height: 12),
          _buildPriceRow('Delivery Fee', '${order.deliveryFee} EGP', isBold: false),
          const Divider(),
          _buildPriceRow('Total', '${order.totalAmount} EGP', isBold: true, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, {required bool isBold, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.w400)),
        Text(price, style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: isTotal ? Colors.orange : Colors.black
        )),
      ],
    );
  }
}