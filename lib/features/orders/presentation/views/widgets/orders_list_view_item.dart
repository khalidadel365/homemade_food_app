import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../data/models/orders_model.dart';

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.push(
        //   AppRouter.kOrderDetailsView,
        //   extra: order,
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade300),
                const SizedBox(height: 12),
                _buildBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    String status = order.status ?? 'pending';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ORDER # ${order.orderId?.substring(0, 5) ?? ''}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              order.chefName ?? "Unknown Chef",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusBackgroundColor(status),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status.replaceAll('_', ' ').toUpperCase(),
            style: Styles.textStyle13.copyWith(
              color: _getStatusTextColor(status),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.formattedCreatedAt,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${order.totalAmount ?? '0'} EGP',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Track Order',
            style: Styles.textStyle13.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return Colors.green.withOpacity(0.1);
      case 'out_for_delivery':
        return Colors.blue.withOpacity(0.1);
      case 'delivered':
        return Colors.teal.withOpacity(0.1);
      case 'rejected':
        return Colors.red.withOpacity(0.1);
      case 'cancelled':
        return Colors.orange.withOpacity(0.1);
      case 'pending':
      default:
        return kPrimaryColor.withOpacity(0.1);
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return Colors.green;
      case 'out_for_delivery':
        return Colors.blue.shade700;
      case 'delivered':
        return Colors.teal;
      case 'rejected':
        return Colors.red;
      case 'cancelled':
        return Colors.orange.shade800;
      case 'pending':
      default:
        return kPrimaryColor;
    }
  }
}