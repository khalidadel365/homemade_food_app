import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import '../../../../core/utilities/service_locator.dart';
import '../../data/repos/orders_repo.dart';
import '../manager/cubit/orders_cubit.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(
        getIt.get<OrderRepo>(),
      )..fetchOrders(token: ApiConstants.token!),
      child: const Scaffold(
        body: OrdersViewBody(),
      ),
    );
  }
}