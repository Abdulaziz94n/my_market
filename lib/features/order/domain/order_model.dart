// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';

class OrderModel {
  final List<OrderItemModel> orderItems;
  final String createdBy;
  final DateTime? createdAt;
  OrderModel({
    required this.orderItems,
    required this.createdBy,
    this.createdAt,
  });

  OrderModel copyWith({
    List<OrderItemModel>? orderItems,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return OrderModel(
      orderItems: orderItems ?? this.orderItems,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderItems: List<OrderItemModel>.from(
        (map['orderItems'] as List<int>).map<OrderItemModel>(
          (x) => OrderItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderModel(orderItems: $orderItems, createdBy: $createdBy, createdAt: $createdAt)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.orderItems, orderItems) &&
        other.createdBy == createdBy &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      orderItems.hashCode ^ createdBy.hashCode ^ createdAt.hashCode;
}
