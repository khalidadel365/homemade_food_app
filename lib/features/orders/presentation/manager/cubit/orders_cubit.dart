import 'package:bloc/bloc.dart';
import '../../../data/repos/orders_repo.dart';
import '../states/orders_states.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  OrdersCubit(this.orderRepo) : super(FetchOrdersInitial());

  final OrderRepo orderRepo;

  Future<void> fetchOrders({required String token}) async {
    emit(FetchOrdersLoading());

    var result = await orderRepo.getOrders(token: token);

    result.fold(
          (failure) {
        emit(FetchOrdersFailure(failure.errorMessage));
      },
          (orders) {
        emit(FetchOrdersSuccess(orders));
      },
    );
  }
}