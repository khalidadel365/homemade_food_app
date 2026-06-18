class OrderSocketModel {
  final String notificationType;
  final String orderId;
  final String message;
  final String createdAt;

  OrderSocketModel({
    required this.notificationType,
    required this.orderId,
    required this.message,
    required this.createdAt,
  });

  factory OrderSocketModel.fromJson(Map<String, dynamic> json) {
    return OrderSocketModel(
      notificationType: json['notification_type'] ?? '',
      orderId: json['order_id'] ?? '',
      message: json['message'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}