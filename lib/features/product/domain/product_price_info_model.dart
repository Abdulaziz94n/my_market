// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProvidersDetails {
  final double buyPrice;
  final String providerName;
  ProvidersDetails({
    required this.buyPrice,
    required this.providerName,
  });

  ProvidersDetails copyWith({
    double? buyPrice,
    String? providerName,
  }) {
    return ProvidersDetails(
      buyPrice: buyPrice ?? this.buyPrice,
      providerName: providerName ?? this.providerName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'buyPrice': buyPrice,
      'providerName': providerName,
    };
  }

  factory ProvidersDetails.fromMap(Map<String, dynamic> map) {
    return ProvidersDetails(
      buyPrice: map['buyPrice'] as double,
      providerName: map['providerName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvidersDetails.fromJson(String source) =>
      ProvidersDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProviderDetails(buyPrice: $buyPrice, providerName: $providerName)';

  @override
  bool operator ==(covariant ProvidersDetails other) {
    if (identical(this, other)) return true;

    return other.buyPrice == buyPrice && other.providerName == providerName;
  }

  @override
  int get hashCode => buyPrice.hashCode ^ providerName.hashCode;
}
