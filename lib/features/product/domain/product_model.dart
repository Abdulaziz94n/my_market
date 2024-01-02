// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/core/utils/optional_model.dart';
import 'package:my_market/features/product/domain/product_entity.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:uuid/uuid.dart';

class ProductModel {
  final int localId;
  final String globalId;
  final String name;
  final String desc;
  final String barcode;
  final String shortCode;
  final double sellPrice;
  final int categoryId;
  final int stockCount;
  final int alertCount;
  final ProvidersDetails providersDetails;
  final String createdBy;
  final DateTime? createdAt;
  final DateTime? expirationDate;
  final int? utilityId;

  const ProductModel({
    this.localId = 0,
    required this.globalId,
    required this.categoryId,
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

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      localId: entity.id,
      globalId: entity.globalId,
      categoryId: entity.categoryId,
      name: entity.name,
      desc: entity.desc,
      barcode: entity.barcode,
      shortCode: entity.shortCode,
      sellPrice: entity.sellPrice,
      alertCount: entity.alertCount,
      providersDetails: entity.providersDetails!,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      stockCount: entity.stockCount,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: localId,
      name: name,
      desc: desc,
      globalId: globalId,
      barcode: barcode,
      shortCode: shortCode,
      sellPrice: sellPrice,
      categoryId: categoryId,
      stockCount: stockCount,
      alertCount: alertCount,
      createdBy: createdBy,
      createdAt: createdAt,
      expirationDate: expirationDate,
      providersDetails: providersDetails,
      utilityId: utilityId,
    );
  }

  double get buyPrice => providersDetails.buyPrice;

  static ProductModel initial() {
    final uuid = const Uuid().v4();
    return ProductModel(
        localId: 0,
        name: '',
        desc: 'desc',
        barcode: '',
        globalId: uuid,
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
    Optional<DateTime>? expirationDate,
    int? utilityId,
  }) {
    return ProductModel(
      localId: localId,
      globalId: globalId,
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
      expirationDate:
          expirationDate != null ? expirationDate.value : this.expirationDate,
      utilityId: utilityId ?? this.utilityId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': localId,
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
      localId: map['id'] as int,
      globalId: map['globalId'] as String,
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
    return 'ProductModel(localId: $localId, globalId: $globalId, name: $name, desc: $desc, barcode: $barcode, shortCode: $shortCode, sellPrice: $sellPrice, categoryId: $categoryId, stockCount: $stockCount, alertCount: $alertCount, providersDetails: $providersDetails, createdBy: $createdBy, createdAt: $createdAt, expirationDate: $expirationDate, utilityId: $utilityId)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.localId == localId &&
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
    return localId.hashCode ^
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
