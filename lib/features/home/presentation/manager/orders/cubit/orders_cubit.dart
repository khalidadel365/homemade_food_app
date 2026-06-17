import 'dart:convert';
import 'package:bloc/bloc.dart';
import '../../../../data/models/order_requested_model.dart';
import '../../../../data/models/order_socket_response.dart';
import '../../../../data/repos/home_repo.dart';
import '../states/orders_states.dart';
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
          final Map<String, dynamic> responseMap =
          event is String ? jsonDecode(event) : event;
          final socketResponse = OrderSocketResponse.fromJson(responseMap);

          if (socketResponse.type == 'new_order') {
            emit(NewIncomingOrderSuccess(socketResponse.data));
          } else if (socketResponse.type == 'order_canceled') {
            emit(OrderCanceledSuccess(socketResponse.data));
          }
          else if (socketResponse.type == 'delivered') {
            emit(OrderDeliveredSuccess(socketResponse.data));
          }
        } catch (e) {
          print("An Error has occurred");
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