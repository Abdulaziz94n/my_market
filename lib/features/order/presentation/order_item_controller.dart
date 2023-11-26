import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';

class OrderItemController extends AutoDisposeNotifier<OrderItemModel?> {
  @override
  build() {
    return null;
  }

  void selectOrderItem(OrderItemModel orderItem) {
    state = orderItem;
  }

  void unselectOrderItem() {
    state = null;
  }
}

final selectedOrderItem =
    NotifierProvider.autoDispose<OrderItemController, OrderItemModel?>(
        OrderItemController.new);
