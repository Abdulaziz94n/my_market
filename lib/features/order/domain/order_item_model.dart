// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/order/domain/order_product_model.dart';

class OrderItemModel {
  final OrderProductModel product;
  final int quantity;
  OrderItemModel({
    required this.product,
    required this.quantity,
  });

  OrderItemModel copyWith({
    OrderProductModel? product,
    int? quantity,
  }) {
    return OrderItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      product:
          OrderProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) =>
      OrderItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderItemModel(product: $product, quantity: $quantity)';

  @override
  bool operator ==(covariant OrderItemModel other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
