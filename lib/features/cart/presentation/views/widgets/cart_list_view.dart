import 'package:flutter/material.dart';

import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 20,right: 15),
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => CartListViewItem()),
    );
  }
}