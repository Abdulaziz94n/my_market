// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ScaleProductEntity {
  int id;
  String globalId;
  String name;
  String desc;
  String barcode;
  String shortCode;
  int categoryId;
  double unitSellPrice;
  double kgSellPrice;
  int stockCount;
  int alertCount;
  List<ProvidersDetails>? providersDetails;
  String createdBy;
  DateTime? createdAt;
  DateTime? expirationDate;
  int unitCount;
  int unitWeight;
  int unitPrice;
  int kgPrice;
  ScaleProductEntity({
    this.id = 0,
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
    this.providersDetails,
    required this.createdBy,
    this.createdAt,
    this.expirationDate,
    required this.unitCount,
    required this.unitWeight,
    required this.unitPrice,
    required this.kgPrice,
  });

  String get dbProvidersDetails {
    List<Map<String, dynamic>> jsonList = providersDetails!
        .map((providerDetails) => {
              'buyPrice': providerDetails.buyPrice,
              'provider': providerDetails.provider.toMap(),
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
}
