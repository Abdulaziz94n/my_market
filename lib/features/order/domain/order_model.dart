// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String orderId;
  final int ticketNo;
  final List<OrderItemModel> orderItems;
  final String createdBy;
  final DateTime? createdAt;
  OrderModel({
    this.ticketNo = 0,
    required this.orderItems,
    required this.createdBy,
    this.createdAt,
  }) : orderId = const Uuid().v4();

  OrderModel copyWith({
    String? orderId,
    int? ticketNo,
    List<OrderItemModel>? orderItems,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return OrderModel(
      ticketNo: ticketNo ?? this.ticketNo,
      orderItems: orderItems ?? this.orderItems,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'ticketNo': ticketNo,
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      ticketNo: map['ticketNo'] as int,
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

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, ticketNo: $ticketNo, orderItems: $orderItems, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId && listEquals(other.orderItems, orderItems);
  }

  @override
  int get hashCode {
    return orderId.hashCode ^ ticketNo.hashCode ^ orderItems.hashCode;
  }
}
