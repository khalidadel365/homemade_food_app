import 'package:bloc/bloc.dart';

import '../../../data/repos/order_details_repo.dart';
import '../states/order_details_states.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsStates> {
  OrderDetailsCubit(this.repo) : super(OrderDetailsInitialState());

  final OrderDetailsRepo repo;

  Future<void> fetchOrderDetails({required String token, required String orderId}) async {
    emit(OrderDetailsLoadingState());
    var result = await repo.getOrderDetails(token: token, orderId: orderId);
    result.fold(
          (failure) => emit(OrderDetailsFailureState(failure.errorMessage)),
          (order) => emit(OrderDetailsSuccessState(order)),
    );
  }
}