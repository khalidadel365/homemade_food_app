import 'package:flutter/material.dart';
import '../../../data/models/orders_model.dart';
import 'orders_list_view_item.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.orders,
  });

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => OrdersListViewItem(
        order: orders[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: orders.length,
    );
  }
}