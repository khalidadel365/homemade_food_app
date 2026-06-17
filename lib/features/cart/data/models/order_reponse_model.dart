class OrderResponseModel {
  final String orderId;
  final String status;
  final String subtotal;
  final String deliveryFee;
  final String totalAmount;
  final int estimatedPreparationMinutes;
  final String chefName;

  OrderResponseModel({
    required this.orderId,
    required this.status,
    required this.subtotal,
    required this.deliveryFee,
    required this.totalAmount,
    required this.estimatedPreparationMinutes,
    required this.chefName,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      orderId: json['order_id'] ?? '',
      status: json['status'] ?? 'pending',
      subtotal: json['subtotal'] ?? '0.00',
      deliveryFee: json['delivery_fee'] ?? '0.00',
      totalAmount: json['total_amount'] ?? '0.00',
      estimatedPreparationMinutes: json['estimated_preparation_minutes'] ?? 0,
      chefName: json['chef_name'] ?? '',
    );
  }
}