// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:my_market/features/product/domain/scale_product_entity.dart';

class ScaleProductModel {
  final int localId;
  final String globalId;
  final String name;
  final String desc;
  final String barcode;
  final String shortCode;
  final int categoryId;
  final double unitSellPrice;
  final double kgSellPrice;
  final int stockCount;
  final int alertCount;
  final List<ProvidersDetails> providersDetails;
  final String createdBy;
  final DateTime? createdAt;
  final DateTime? expirationDate;
  final int unitCount;
  final int unitWeight;
  final int unitPrice;
  final int kgPrice;

  ScaleProductModel({
    this.localId = 0,
    required this.globalId,
    required this.name,
    required this.desc,
    required this.barcode,
    required this.shortCode,
    required this.categoryId,
    required this.unitSellPrice,
    required this.kgSellPrice,
    required this.stockCount,
    required this.alertCount,
    required this.providersDetails,
    required this.createdBy,
    required this.createdAt,
    this.expirationDate,
    required this.unitCount,
    required this.unitWeight,
    required this.unitPrice,
    required this.kgPrice,
  });

  double get buyPrice => providersDetails.first.buyPrice;

  ScaleProductModel copyWith({
    String? name,
    String? desc,
    String? barcode,
    String? shortCode,
    int? categoryId,
    double? unitSellPrice,
    double? kgSellPrice,
    int? stockCount,
    int? alertCount,
    List<ProvidersDetails>? providersDetails,
    String? createdBy,
    DateTime? createdAt,
    DateTime? expirationDate,
    int? unitCount,
    int? unitWeight,
    int? unitPrice,
    int? kgPrice,
  }) {
    return ScaleProductModel(
      localId: localId,
      globalId: globalId,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      barcode: barcode ?? this.barcode,
      shortCode: shortCode ?? this.shortCode,
      categoryId: categoryId ?? this.categoryId,
      unitSellPrice: unitSellPrice ?? this.unitSellPrice,
      kgSellPrice: kgSellPrice ?? this.kgSellPrice,
      stockCount: stockCount ?? this.stockCount,
      alertCount: alertCount ?? this.alertCount,
      providersDetails: providersDetails ?? this.providersDetails,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      expirationDate: expirationDate ?? this.expirationDate,
      unitCount: unitCount ?? this.unitCount,
      unitWeight: unitWeight ?? this.unitWeight,
      unitPrice: unitPrice ?? this.unitPrice,
      kgPrice: kgPrice ?? this.kgPrice,
    );
  }

  ScaleProductEntity toEntity() {
    return ScaleProductEntity(
      globalId: globalId,
      createdAt: createdAt,
      expirationDate: expirationDate,
      name: name,
      desc: desc,
      barcode: barcode,
      shortCode: shortCode,
      categoryId: categoryId,
      unitSellPrice: unitSellPrice,
      kgSellPrice: kgSellPrice,
      stockCount: stockCount,
      alertCount: alertCount,
      providersDetails: providersDetails,
      createdBy: createdBy,
      unitCount: unitCount,
      unitWeight: unitWeight,
      unitPrice: unitPrice,
      kgPrice: kgPrice,
    );
  }

  factory ScaleProductModel.fromEntity(ScaleProductEntity entity) {
    return ScaleProductModel(
      globalId: entity.globalId,
      name: entity.name,
      desc: entity.desc,
      barcode: entity.barcode,
      shortCode: entity.shortCode,
      categoryId: entity.categoryId,
      unitSellPrice: entity.unitSellPrice,
      kgSellPrice: entity.kgSellPrice,
      stockCount: entity.stockCount,
      alertCount: entity.alertCount,
      providersDetails: entity.providersDetails!,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      unitCount: entity.unitCount,
      unitWeight: entity.unitWeight,
      unitPrice: entity.unitPrice,
      kgPrice: entity.kgPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'globalId': globalId,
      'name': name,
      'desc': desc,
      'barcode': barcode,
      'shortCode': shortCode,
      'categoryId': categoryId,
      'unitSellPrice': unitSellPrice,
      'kgSellPrice': kgSellPrice,
      'stockCount': stockCount,
      'alertCount': alertCount,
      'providersDetails': providersDetails.map((e) => e.toMap()).toList(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      if (expirationDate != null)
        'expirationDate': Timestamp.fromDate(expirationDate!),
      'unitCount': unitCount,
      'unitWeight': unitWeight,
      'unitPrice': unitPrice,
      'kgPrice': kgPrice,
    };
  }

  factory ScaleProductModel.fromMap(Map<String, dynamic> map) {
    return ScaleProductModel(
      localId: map['localId'] as int,
      globalId: map['globalId'] as String,
      name: map['name'] as String,
      desc: map['desc'] as String,
      barcode: map['barcode'] as String,
      shortCode: map['shortCode'] as String,
      categoryId: map['categoryId'] as int,
      unitSellPrice: map['unitSellPrice'] as double,
      kgSellPrice: map['kgSellPrice'] as double,
      stockCount: map['stockCount'] as int,
      alertCount: map['alertCount'] as int,
      providersDetails: (map['providerDetails'] as List<dynamic>?)!
          .map((providerData) =>
              ProvidersDetails.fromMap(providerData as Map<String, dynamic>))
          .toList(),
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      expirationDate: map['expirationDate'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      unitCount: map['unitCount'] as int,
      unitWeight: map['unitWeight'] as int,
      unitPrice: map['unitPrice'] as int,
      kgPrice: map['kgPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScaleProductModel.fromJson(String source) =>
      ScaleProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScaleProductModel(localId: $localId, name: $name, desc: $desc, barcode: $barcode, shortCode: $shortCode, categoryId: $categoryId, unitSellPrice: $unitSellPrice, kgSellPrice: $kgSellPrice, stockCount: $stockCount, alertCount: $alertCount, providersDetails: $providersDetails, createdBy: $createdBy, createdAt: $createdAt, expirationDate: $expirationDate, unitCount: $unitCount, unitWeight: $unitWeight, unitPrice: $unitPrice, kgPrice: $kgPrice)';
  }

  @override
  bool operator ==(covariant ScaleProductModel other) {
    if (identical(this, other)) return true;

    return other.localId == localId &&
        other.globalId == globalId &&
        other.name == name &&
        other.desc == desc &&
        other.barcode == barcode &&
        other.shortCode == shortCode &&
        other.categoryId == categoryId &&
        other.unitSellPrice == unitSellPrice &&
        other.kgSellPrice == kgSellPrice &&
        other.stockCount == stockCount &&
        other.alertCount == alertCount &&
        other.providersDetails == providersDetails &&
        other.createdBy == createdBy &&
        other.createdAt == createdAt &&
        other.expirationDate == expirationDate &&
        other.unitCount == unitCount &&
        other.unitWeight == unitWeight &&
        other.unitPrice == unitPrice &&
        other.kgPrice == kgPrice;
  }

  @override
  int get hashCode {
    return localId.hashCode ^
        globalId.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        barcode.hashCode ^
        shortCode.hashCode ^
        categoryId.hashCode ^
        unitSellPrice.hashCode ^
        kgSellPrice.hashCode ^
        stockCount.hashCode ^
        alertCount.hashCode ^
        providersDetails.hashCode ^
        createdBy.hashCode ^
        createdAt.hashCode ^
        expirationDate.hashCode ^
        unitCount.hashCode ^
        unitWeight.hashCode ^
        unitPrice.hashCode ^
        kgPrice.hashCode;
  }
}
