import 'package:intl/intl.dart';

class OrderModel {
  final String? orderId;
  final String? customerName;
  final String? chefName;
  final String? status;
  final String? totalAmount;
  final DateTime? createdAt;
  final int? itemsCount;
  final DateTime? estimatedReadyTime;

  OrderModel({
    this.orderId,
    this.customerName,
    this.chefName,
    this.status,
    this.totalAmount,
    this.createdAt,
    this.itemsCount,
    this.estimatedReadyTime,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as String?,
      customerName: json['customer_name'] as String?,
      chefName: json['chef_name'] as String?,
      status: json['status'] as String?,
      totalAmount: json['total_amount'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      itemsCount: json['items_count'] as int?,
      estimatedReadyTime: json['estimated_ready_time'] != null
          ? DateTime.tryParse(json['estimated_ready_time'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'customer_name': customerName,
      'chef_name': chefName,
      'status': status,
      'total_amount': totalAmount,
      'created_at': createdAt?.toIso8601String(),
      'items_count': itemsCount,
      'estimated_ready_time': estimatedReadyTime?.toIso8601String(),
    };
  }

  String get formattedCreatedAt {
    if (createdAt == null) return '';
    return DateFormat('MMM dd, yyyy - h:mm a').format(createdAt!);
  }
}