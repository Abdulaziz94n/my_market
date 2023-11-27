import 'package:my_market/features/order/domain/order_item_model.dart';

extension OrderItemsListX on List<OrderItemModel> {
  double get calcTotal => fold(
        0,
        (previousValue, element) =>
            previousValue + (element.product.price * element.quantity),
      );
}
