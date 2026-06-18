import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:homemade_food_app/features/home/presentation/manager/orders/states/orders_states.dart';
import '../../../../data/models/order_requested_model.dart';
import '../../../../data/models/order_socket_model.dart';
import '../../../../data/repos/home_repo.dart';
import 'dart:async';

class OrdersCubit extends Cubit<OrdersState> {
  final HomeRepo homeRepo;
  StreamSubscription? _ordersSubscription;

  OrdersCubit(this.homeRepo) : super(OrdersInitial());

  List<OrderRequestedModel> incomingOrders = [];
  List<OrderRequestedModel> preparingOrders = [];

  void initSocket(String token) {
    print("Attempting to connect to socket with token: $token");
    _ordersSubscription?.cancel();
    homeRepo.initOrdersSocket(token: token);

    _ordersSubscription = homeRepo.listenToOrders().listen((event) {
      print("Socket Event Received: $event");
      if (!isClosed) {
        try {
          final Map<String, dynamic> responseMap = event is String ? jsonDecode(event) : event;

          if (responseMap['type'] == 'order_notification') {
            final Map<String, dynamic> data = responseMap['data'];
            final String notificationType = data['notification_type'];

            if (notificationType == 'order_accepted') {
              emit(PreparingSuccess(OrderSocketModel.fromJson(data)));
            } else if (notificationType == 'out_for_delivery') {
              emit(OutForDeliverySuccess(OrderSocketModel.fromJson(data)));
            } else if (notificationType == 'delivered') {
              emit(OrderDeliveredSuccess(OrderSocketModel.fromJson(data)));
            } else if (notificationType == 'order_rejected' || notificationType == 'order_cancelled') {
              emit(OrderCanceledSuccess(OrderSocketModel.fromJson(data)));
            }
          }
        } catch (e) {
          print("An Error has occurred: $e");
        }
      }
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    homeRepo.closeSocket();
    return super.close();
  }

}