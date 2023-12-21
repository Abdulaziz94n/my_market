// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_market/features/client/domain/credit_client_model.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

// @Entity()
class CreditOrderModel {
  @Id()
  int dbId = 0;
  @Unique()
  final String orderId;
  final int ticketNo;
  final String clientId;
  List<OrderItemModel> orderItems;
  final bool isPaid;
  final int createdBy;
  final DateTime? createdAt;
  final client = ToOne<CreditClientModel>();
  CreditOrderModel({
    this.ticketNo = 0,
    required this.orderItems,
    required this.createdBy,
    required this.isPaid,
    this.createdAt,
    this.clientId = '0',
  }) : orderId = const Uuid().v4();

  String get ordersJson {
    return jsonEncode(orderItems.map((e) => e.toJson()).toList());
  }

  set ordersJson(String value) {
    orderItems = List<OrderItemModel>.from(
        jsonDecode(value).map((e) => OrderItemModel.fromJson(e)));
  }

  CreditOrderModel copyWith({
    String? orderId,
    int? ticketNo,
    List<OrderItemModel>? orderItems,
    int? createdBy,
    DateTime? createdAt,
    bool? isPaid,
    final String? clientId,
  }) {
    return CreditOrderModel(
      ticketNo: ticketNo ?? this.ticketNo,
      isPaid: isPaid ?? this.isPaid,
      orderItems: orderItems ?? this.orderItems,
      clientId: clientId ?? this.clientId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'isPaid': isPaid,
      'ticketNo': ticketNo,
      'clientId': clientId,
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    };
  }

  factory CreditOrderModel.fromMap(Map<String, dynamic> map) {
    return CreditOrderModel(
      isPaid: map['isPaid'],
      ticketNo: map['ticketNo'] as int,
      clientId: map['clientId'] as String,
      orderItems: List<OrderItemModel>.from(
        (map['orderItems'] as List<int>).map<OrderItemModel>(
          (x) => OrderItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdBy: map['createdBy'] as int,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, ticketNo: $ticketNo, clientId: $clientId, orderItems: $orderItems, createdBy: $createdBy, createdAt: $createdAt, dbId: $dbId)';
  }

  @override
  bool operator ==(covariant CreditOrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.clientId == clientId &&
        other.isPaid == isPaid &&
        listEquals(other.orderItems, orderItems);
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        clientId.hashCode ^
        ticketNo.hashCode ^
        isPaid.hashCode ^
        orderItems.hashCode;
  }
}
