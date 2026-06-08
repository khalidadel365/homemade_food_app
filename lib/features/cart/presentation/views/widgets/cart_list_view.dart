import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/cubit/cart_cubit.dart';
import '../../manager/states/cart_states.dart';
import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        var items = cubit.cartItems;

        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Your cart is empty yet.',
                style: Styles.textStyle14,
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20, right: 15),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => CartListViewItem(
            cartItem: items[index],
          ),
        );
      },
    );
  }
}