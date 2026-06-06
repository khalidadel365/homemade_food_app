import 'package:flutter/material.dart';

import 'orders_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrdersListView(),
    );
  }
}
