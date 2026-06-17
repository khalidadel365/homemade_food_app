import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/order_details/presentation/views/widgets/order_details_view_body.dart';

import '../../../../core/utilities/api_constants.dart';
import '../manager/cubit/order_details_cubit.dart';
import '../manager/states/order_details_states.dart';

class OrderDetailsView extends StatefulWidget {
  final String orderId;
  const OrderDetailsView({super.key, required this.orderId});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsCubit>().fetchOrderDetails(
        token: ApiConstants.token!,
        orderId: widget.orderId
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsStates>(
        builder: (context, state) {
          if (state is OrderDetailsSuccessState) {
            return OrderDetailsViewBody(order: state.order);
          } else if (state is OrderDetailsFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
