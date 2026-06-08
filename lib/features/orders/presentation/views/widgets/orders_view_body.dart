import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';

import '../../manager/cubit/orders_cubit.dart';
import '../../manager/states/orders_states.dart';
import 'orders_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (context, state) {
        if (state is FetchOrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchOrdersSuccess) {
          if (state.orders.isEmpty) {
            return Center(
              child: Text(
                'No orders found',
                style: Styles.textStyle15,
              ),
            );
          } else {
            return Scaffold(
              body: OrdersListView(orders: state.orders),
            );
          }
        } else if (state is FetchOrdersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: Text('No orders found'),
          );
        }
      },
    );
  }
}
