// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/product/domain/product_provider_model.dart';

class ProvidersDetails {
  final List<double> buyPrice;
  final ProductProviderModel provider;
  const ProvidersDetails({
    required this.buyPrice,
    required this.provider,
  });

  ProvidersDetails copyWith({
    List<double>? buyPrice,
    ProductProviderModel? provider,
  }) {
    return ProvidersDetails(
      buyPrice: buyPrice ?? this.buyPrice,
      provider: provider ?? this.provider,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'buyPrice': buyPrice,
      'provider': provider.toMap(),
    };
  }

  factory ProvidersDetails.fromMap(Map<String, dynamic> map) {
    return ProvidersDetails(
      buyPrice: List.from(map['buyPrice']),
      provider:
          ProductProviderModel.fromMap(map['provider'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvidersDetails.fromJson(String source) =>
      ProvidersDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProvidersDetails(buyPrice: $buyPrice, provider: $provider)';

  @override
  bool operator ==(covariant ProvidersDetails other) {
    if (identical(this, other)) return true;

    return other.buyPrice == buyPrice && other.provider == provider;
  }

  @override
  int get hashCode => buyPrice.hashCode ^ provider.hashCode;
}
