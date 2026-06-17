import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomOrderStepper extends StatelessWidget {
  final String status;

  const CustomOrderStepper({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // تحديد حالة كل خطوة بناءً على الـ status
    bool isPreparing = status.toLowerCase() == 'preparing';
    bool isOutForDelivery = status.toLowerCase() == 'out_for_delivery';
    bool isDelivered = status.toLowerCase() == 'delivered';

    return Column(
      children: [
        _buildTile(
          title: "Order Confirmed",
          subtitle: "Confirmed at 2:35 PM", // ممكن تغيرها لـ order.createdAt لو معاك
          isFirst: true,
          isLast: false,
          isActive: true, // دايماً نشطة في البداية
        ),
        _buildTile(
          title: "Preparing",
          subtitle: "Chef is working their magic",
          isFirst: false,
          isLast: false,
          isActive: isPreparing || isOutForDelivery || isDelivered,
          color: isPreparing ? kPrimaryColor : (isOutForDelivery || isDelivered ? kPrimaryColor : Colors.grey),
        ),
        _buildTile(
          title: "Out for Delivery",
          subtitle: "On the way to you",
          isFirst: false,
          isLast: true,
          isActive: isOutForDelivery || isDelivered,
          color: isOutForDelivery || isDelivered ? kPrimaryColor : Colors.grey,
        ),
      ],
    );
  }

  Widget _buildTile({
    required String title,
    required String subtitle,
    required bool isFirst,
    required bool isLast,
    required bool isActive,
    Color color = kPrimaryColor,
  }) {
    return SizedBox(
      height: 70, // المسافة بين الخطوات
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: isActive ? color : Colors.grey.shade300, thickness: 2),
        indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          color: isActive ? color : Colors.grey.shade300,
          iconStyle: IconStyle(iconData: Icons.check, color: Colors.white),
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isActive ? Colors.black : Colors.grey)),
              if (subtitle.isNotEmpty)
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}