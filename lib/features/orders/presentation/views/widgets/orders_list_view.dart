import 'package:flutter/material.dart';

import 'orders_list_view_item.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const OrdersListViewItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemCount: 5);
  }
}