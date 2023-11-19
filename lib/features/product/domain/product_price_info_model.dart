// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProviderDetails {
  final double buyPrice;
  final String providerName;
  ProviderDetails({
    required this.buyPrice,
    required this.providerName,
  });

  ProviderDetails copyWith({
    double? buyPrice,
    String? providerName,
  }) {
    return ProviderDetails(
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

  factory ProviderDetails.fromMap(Map<String, dynamic> map) {
    return ProviderDetails(
      buyPrice: map['buyPrice'] as double,
      providerName: map['providerName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderDetails.fromJson(String source) =>
      ProviderDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProviderDetails(buyPrice: $buyPrice, providerName: $providerName)';

  @override
  bool operator ==(covariant ProviderDetails other) {
    if (identical(this, other)) return true;

    return other.buyPrice == buyPrice && other.providerName == providerName;
  }

  @override
  int get hashCode => buyPrice.hashCode ^ providerName.hashCode;
}
