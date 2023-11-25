import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';
import 'package:my_market/features/order/presentation/order_item_controller.dart';
import 'package:my_market/features/users/presentation/user_controller.dart';

class NewOrderController extends Notifier<OrderModel> {
  @override
  build() {
    return OrderModel(orderItems: [], createdBy: ref.read(userProvider)!.id);
  }

  void addOrderItem(OrderItemModel orderItem) {
    if (state.orderItems.any((item) => item.product == orderItem.product)) {
      return;
    }

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

  void setQuantity(OrderItemModel orderItem, int quantity) {
    final index = state.orderItems.indexOf(orderItem);
    final currentItem = state.orderItems[index];
    state.orderItems[index] = currentItem.copyWith(quantity: quantity);
    // TODO: Improve Implementation
    ref
        .read(selectedOrderItem.notifier)
        .selectOrderItem(state.orderItems[index]);
    state = state.copyWith(orderItems: [...state.orderItems]);
  }

  void clearItems() {
    state = state.copyWith(orderItems: []);
  }

  void _removeItem(OrderItemModel orderItem) {
    state.orderItems.remove(orderItem);
    state = state.copyWith(orderItems: [...state.orderItems]);
  }
}

final newOrderController =
    NotifierProvider<NewOrderController, OrderModel>(NewOrderController.new);
