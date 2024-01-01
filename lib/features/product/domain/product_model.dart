// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:uuid/uuid.dart';

class ProductModel {
  int id;
  int categoryId;
  final String name;
  final String desc;
  final String barcode;
  final String shortCode;
  final double sellPrice;
  final int stockCount;
  final int alertCount;
  final ProvidersDetails providersDetails;
  final String createdBy;
  final DateTime? createdAt;
  final DateTime? expirationDate;
  final int? utilityId;

  ProductModel({
    this.id = 0,
    this.categoryId = 0,
    required this.name,
    required this.desc,
    required this.barcode,
    required this.shortCode,
    required this.sellPrice,
    required this.alertCount,
    required this.providersDetails,
    required this.createdBy,
    required this.createdAt,
    required this.stockCount,
    this.expirationDate,
    this.utilityId,
  });

  double get buyPrice => providersDetails.buyPrice;

  static ProductModel initial() {
    final uuid = const Uuid().v4();
    return ProductModel(
        id: 0,
        name: '',
        desc: 'desc',
        barcode: '',
        shortCode: uuid.substring(0, 5),
        categoryId: 0,
        sellPrice: 0,
        alertCount: 0,
        providersDetails: ProvidersDetails(
          buyPrice: 0,
          provider: ProductProviderModel(name: 'name', id: 1),
        ),
        createdBy: 'created by',
        createdAt: null,
        stockCount: 0,
        expirationDate: null,
        utilityId: null);
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? desc,
    String? barcode,
    String? shortCode,
    int? categoryId,
    double? sellPrice,
    int? alertCount,
    int? stockCount,
    ProvidersDetails? providersDetails,
    String? createdBy,
    DateTime? createdAt,
    DateTime? expirationDate,
    int? utilityId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      barcode: barcode ?? this.barcode,
      shortCode: shortCode ?? this.shortCode,
      categoryId: categoryId ?? this.categoryId,
      sellPrice: sellPrice ?? this.sellPrice,
      alertCount: alertCount ?? this.alertCount,
      stockCount: stockCount ?? this.stockCount,
      providersDetails: providersDetails ?? this.providersDetails,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      expirationDate: expirationDate ?? this.expirationDate,
      utilityId: utilityId ?? this.utilityId,
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
      'sellPrice': sellPrice,
      'alertCount': alertCount,
      'stockCount': stockCount,
      'utilityId': utilityId,
      'providerDetails': providersDetails.toMap(),
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      'expirationDate': expirationDate,
      if (createdAt != null) 'expirationDate': Timestamp.fromDate(createdAt!),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      barcode: map['barcode'] as String,
      shortCode: map['shortCode'] as String,
      categoryId: map['categoryId'] as int,
      sellPrice: map['sellPrice'] as double,
      alertCount: map['alertCount'] as int,
      stockCount: map['stockCount'] as int,
      utilityId: map['utilityId'] as int?,
      providersDetails: ProvidersDetails.fromMap(
        map['providerDetails'] as Map<String, dynamic>,
      ),
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      expirationDate: map['expirationDate'] != null
          ? (map['expirationDate'] as Timestamp).toDate()
          : null,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $desc, barcode: $barcode, shortCode: $shortCode, categoryId: $categoryId, sellPrice: $sellPrice, stockCount: $stockCount, alertCount: $alertCount, providersDetails: $providersDetails, createdBy: $createdBy, createdAt: $createdAt, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.barcode == barcode &&
        other.shortCode == shortCode &&
        other.categoryId == categoryId &&
        other.sellPrice == sellPrice &&
        other.stockCount == stockCount &&
        other.alertCount == alertCount &&
        other.expirationDate == expirationDate &&
        other.providersDetails == providersDetails;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        barcode.hashCode ^
        shortCode.hashCode ^
        categoryId.hashCode ^
        sellPrice.hashCode ^
        stockCount.hashCode ^
        alertCount.hashCode ^
        expirationDate.hashCode ^
        providersDetails.hashCode;
  }
}
