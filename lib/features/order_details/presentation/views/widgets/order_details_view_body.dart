import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/order_details/presentation/views/widgets/price_summary_widget.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../data/models/order_details_model.dart';
import 'delivery_address_widget.dart';
import 'order_item_card.dart';

class OrderDetailsViewBody extends StatelessWidget {
  final OrderDetailsModel order;

  const OrderDetailsViewBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderSummaryContainer(order),
          const SizedBox(height: 30),
          const Text("Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          ...(order.items ?? []).map((item) => OrderItemCard(item: item)),
          const SizedBox(height: 20),
          AddressInfoWidget(
              address: order.deliveryAddress ?? "No Address Provided"),
          const SizedBox(height: 20),
          PriceSummaryWidget(order: order),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryContainer(OrderDetailsModel order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("COOKED BY",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(order.chefName ?? "Chef Name",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          const Divider(height: 30),
          Text("Estimated arrival: ${_formatTime(order.estimatedReadyTime)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 20),
          _buildTimelineStepper(order.status),
        ],
      ),
    );
  }

  String _formatTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return 'N/A';
    try {
      DateTime dateTime = DateTime.parse(timeString);
      return DateFormat("h:mm a").format(dateTime);
    } catch (e) {
      return timeString;
    }
  }

  Widget _buildTimelineStepper(String? status) {
    String currentStatus = status?.toLowerCase() ?? 'pending';

    bool isConfirmed = currentStatus == 'confirmed' ||
        currentStatus == 'preparing' ||
        currentStatus == 'out_for_delivery' ||
        currentStatus == 'delivered';
    bool isPreparing = currentStatus == 'preparing' ||
        currentStatus == 'out_for_delivery' ||
        currentStatus == 'delivered';
    bool isOutForDelivery =
        currentStatus == 'out_for_delivery' || currentStatus == 'delivered';
    bool isDelivered = currentStatus == 'delivered';

    return Column(
      children: [
        _buildTile("Pending", true, false, true, Icons.hourglass_empty),
        _buildTile("Confirmed", false, false, isConfirmed, Icons.check_circle),
        _buildTile("Preparing", false, false, isPreparing, Icons.restaurant),
        _buildTile("Out for Delivery", false, false, isOutForDelivery, Icons.delivery_dining),
        _buildTile("Delivered", false, true, isDelivered, Icons.home_filled),
      ],
    );
  }

  Widget _buildTile(String title, bool isFirst, bool isLast,
      bool isActive, IconData icon) {
    return SizedBox(
      height: 60,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isActive ? kPrimaryColor : Colors.grey.shade300,
            thickness: 2),
        indicatorStyle: IndicatorStyle(
          width: 25,
          height: 25,
          color: isActive ? kPrimaryColor : Colors.grey.shade300,
          iconStyle: IconStyle(iconData: icon, color: Colors.white),
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isActive ? Colors.black : Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}