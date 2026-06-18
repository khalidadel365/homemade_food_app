import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/core/errors/failures.dart';
import 'package:homemade_food_app/core/utilities/api_service.dart';
import 'package:homemade_food_app/features/home/data/models/home_model.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';

import '../service/orders_socket_service.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  final OrdersSocketService socketService;

  HomeRepoImp(this.apiService,this.socketService);

  @override
  void initOrdersSocket({required String token}) {
    //start connection with server
    const String socketUrl = 'wss://wobble-froth-polish.ngrok-free.dev/ws/orders/';
    //const String socketUrl = 'ws://10.0.2.2:8000/ws/orders/';
    socketService.connect('$socketUrl?token=$token');
  }

  @override
  Stream<dynamic> listenToOrders() {
    return socketService.stream;
  }
  @override
  void closeSocket() {
    socketService.close();
  }
  @override
  Future<Either<Failure, HomeModel>> fetchConsumerHomePage() async {
    try {
      var data = await apiService.get(
        endPoint: '/api/dishes/home/',
      );

      HomeModel homeData = HomeModel.fromJson(data);

      return right(homeData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
