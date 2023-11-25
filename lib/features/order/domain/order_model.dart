// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';

class OrderModel {
  final List<OrderItemModel> orderItems;
  OrderModel({
    required this.orderItems,
  });

  OrderModel copyWith({
    List<OrderItemModel>? orderItems,
  }) {
    return OrderModel(
      orderItems: orderItems ?? this.orderItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderItems: List<OrderItemModel>.from(
        (map['orderItems'] as List<int>).map<OrderItemModel>(
          (x) => OrderItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderModel(orderItems: $orderItems)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.orderItems, orderItems);
  }

  @override
  int get hashCode => orderItems.hashCode;
}
