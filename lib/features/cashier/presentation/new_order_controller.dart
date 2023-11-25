import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';

class NewOrderController extends Notifier<OrderModel> {
  @override
  build() {
    return OrderModel(orderItems: []);
  }

  void addOrderItem(OrderItemModel orderItem) {
    if (state.orderItems.contains(orderItem)) return;
    state = state.copyWith(orderItems: [...state.orderItems, orderItem]);
  }

  void increaseQuantity(int index) {
    final currentItem = state.orderItems[index];
    state.orderItems[index] =
        currentItem.copyWith(quantity: currentItem.quantity + 1);
    state = state.copyWith(orderItems: [...state.orderItems]);
  }

  void decreaseQuantity(int index) {
    final currentItem = state.orderItems[index];
    if (currentItem.quantity == 1) {
      _removeItem(currentItem);
      return;
    }
    state.orderItems[index] =
        currentItem.copyWith(quantity: currentItem.quantity - 1);
    state = state.copyWith(orderItems: [...state.orderItems]);
  }

  void _removeItem(OrderItemModel orderItem) {
    state.orderItems.remove(orderItem);
    state = state.copyWith(orderItems: [...state.orderItems]);
  }
}

final newOrderController =
    NotifierProvider<NewOrderController, OrderModel>(NewOrderController.new);
