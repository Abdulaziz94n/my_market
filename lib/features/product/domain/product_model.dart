// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';

class Product {
  final String id;
  final String name;
  final String desc;
  final String barcode;
  final String shortCode;
  final String categoryId;
  final double buyPrice;
  final double sellPrice;
  final int? stockCount;
  final int alertCount;
  final ProvidersDetails providersDetails;
  final String createdBy;
  final DateTime? createdAt;
  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.barcode,
    required this.shortCode,
    required this.categoryId,
    required this.buyPrice,
    required this.sellPrice,
    required this.alertCount,
    required this.providersDetails,
    required this.createdBy,
    required this.createdAt,
    this.stockCount,
  });

  Product copyWith({
    String? id,
    String? name,
    String? desc,
    String? barcode,
    String? shortCode,
    String? categoryId,
    double? buyPrice,
    double? sellPrice,
    int? alertCount,
    int? stockCount,
    ProvidersDetails? providersDetails,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      barcode: barcode ?? this.barcode,
      shortCode: shortCode ?? this.shortCode,
      categoryId: categoryId ?? this.categoryId,
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      alertCount: alertCount ?? this.alertCount,
      stockCount: stockCount ?? this.stockCount,
      providersDetails: providersDetails ?? this.providersDetails,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'barcode': barcode,
      'shortCode': shortCode,
      'categoryId': categoryId,
      'buyPrice': buyPrice,
      'sellPrice': sellPrice,
      'alertCount': alertCount,
      'stockCount': stockCount ?? 0,
      'providerDetails': providersDetails.toMap(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      desc: map['desc'] as String,
      barcode: map['barcode'] as String,
      shortCode: map['shortCode'] as String,
      categoryId: map['categoryId'] as String,
      buyPrice: map['buyPrice'] as double,
      sellPrice: map['sellPrice'] as double,
      alertCount: map['alertCount'] as int,
      stockCount: map['stockCount'] as int,
      providersDetails: ProvidersDetails.fromMap(
        map['providerDetails'] as Map<String, dynamic>,
      ),
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, desc: $desc, barcode: $barcode, shortCode: $shortCode, categoryId: $categoryId, buyPrice: $buyPrice, sellPrice: $sellPrice, alertCount: $alertCount, providerDetails: $providersDetails, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.barcode == barcode &&
        other.shortCode == shortCode &&
        other.categoryId == categoryId &&
        other.buyPrice == buyPrice &&
        other.sellPrice == sellPrice &&
        other.alertCount == alertCount &&
        other.providersDetails == providersDetails &&
        other.createdBy == createdBy &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        barcode.hashCode ^
        shortCode.hashCode ^
        categoryId.hashCode ^
        buyPrice.hashCode ^
        sellPrice.hashCode ^
        alertCount.hashCode ^
        providersDetails.hashCode ^
        createdBy.hashCode ^
        createdAt.hashCode;
  }
}
