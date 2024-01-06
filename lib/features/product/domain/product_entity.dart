// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/categories/domain/category_entity.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ProductEntity {
  int id;
  int secId;
  String globalId;
  String name;
  String desc;
  String barcode;
  String shortCode;
  double sellPrice;
  @Index(type: IndexType.value)
  int stockCount;
  @Index()
  int alertCount;
  String createdBy;
  List<ProvidersDetails>? providersDetails;
  DateTime? createdAt;
  DateTime? expirationDate;
  int? utilityId;

  final category = ToOne<CategoryEntity>();

  ProductEntity({
    required this.name,
    required this.desc,
    required this.barcode,
    required this.shortCode,
    required this.sellPrice,
    required this.stockCount,
    required this.alertCount,
    required this.createdBy,
    required this.globalId,
    required this.secId,
    this.providersDetails,
    this.createdAt,
    this.expirationDate,
    this.utilityId,
    this.id = 0,
  });

  String get dbProvidersDetails {
    List<Map<String, dynamic>> jsonList = providersDetails!
        .map((providerDetails) => {
              'buyPrice': providerDetails.buyPrice,
              'provider': providerDetails.provider.toLocalMap(),
            })
        .toList();
    return jsonEncode(jsonList);
  }

  set dbProvidersDetails(String value) {
    List<dynamic> jsonList = jsonDecode(value);
    providersDetails = jsonList
        .map((providerData) => ProvidersDetails.fromMap(providerData))
        .toList();
  }

  @override
  String toString() {
    return 'ProductEntity(id: $id, globalId: $globalId, name: $name, desc: $desc, barcode: $barcode, shortCode: $shortCode, sellPrice: $sellPrice, categId: $secId, stockCount: $stockCount, alertCount: $alertCount, createdBy: $createdBy, providersDetails: $providersDetails, createdAt: $createdAt, expirationDate: $expirationDate, utilityId: $utilityId)';
  }
}
