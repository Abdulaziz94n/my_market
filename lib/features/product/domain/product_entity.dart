import 'dart:convert';

import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ProductEntity {
  int id;
  String globalId;
  String name;
  String desc;
  String barcode;
  String shortCode;
  double sellPrice;
  int categoryId;
  int stockCount;
  int alertCount;
  String createdBy;
  ProvidersDetails? providersDetails;
  DateTime? createdAt;
  DateTime? expirationDate;
  int? utilityId;
  ProductEntity({
    required this.name,
    required this.desc,
    required this.barcode,
    required this.shortCode,
    required this.sellPrice,
    required this.categoryId,
    required this.stockCount,
    required this.alertCount,
    required this.createdBy,
    required this.globalId,
    this.providersDetails,
    this.createdAt,
    this.expirationDate,
    this.utilityId,
    this.id = 0,
  });

  String get dbProvidersDetails => jsonEncode(providersDetails?.toJson());

  set dbProvidersDetails(String value) =>
      providersDetails = ProvidersDetails.fromJson(jsonDecode(value));
}
