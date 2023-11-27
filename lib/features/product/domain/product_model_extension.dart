import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_product_model.dart';
import 'package:my_market/features/product/domain/product_model.dart';

extension ProductX on Product {
  OrderItemModel get toOrderItem =>
      OrderItemModel(product: OrderProductModel.fromProduct(this), quantity: 1);
}
