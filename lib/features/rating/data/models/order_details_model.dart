
class OrderDetailsModel {
  final String orderId;
  final int chefId;
  final String chefName;
  final String status;

  OrderDetailsModel({
    required this.orderId,
    required this.chefId,
    required this.chefName,
    required this.status,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      orderId: json['order_id'],
      chefId: json['chef'],
      chefName: json['chef_name'],
      status: json['status'],
    );
  }
}