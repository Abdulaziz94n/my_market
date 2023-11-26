import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/data/order_repository.dart';
import 'package:my_market/features/order/domain/order_model.dart';

class SubmitOrderController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> submitOrder(OrderModel orderModel) async {
    if (orderModel.orderItems.isEmpty) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(ordersRepo).addOrderModel(orderModel),
    );
  }
}

final submitOrderController =
    AsyncNotifierProvider<SubmitOrderController, void>(
        SubmitOrderController.new);
