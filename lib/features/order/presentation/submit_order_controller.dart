import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/application/order_service.dart';
import 'package:my_market/features/order/domain/order_model.dart';

class SubmitOrderController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> submitOrder(OrderModel orderModel, int ticketNo) async {
    if (orderModel.orderItems.isEmpty) return;
    orderModel = orderModel.copyWith(
      ticketNo: ticketNo,
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(orderService).submitOrder(orderModel),
    );
  }
}

final submitOrderController =
    AsyncNotifierProvider<SubmitOrderController, void>(
        SubmitOrderController.new);
