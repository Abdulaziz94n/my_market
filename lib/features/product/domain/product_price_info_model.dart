// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProvidersDetails {
  final double buyPrice;
  final ProductProviderModel provider;
  const ProvidersDetails({
    required this.buyPrice,
    required this.provider,
  });

  ProvidersDetails copyWith({
    double? buyPrice,
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
      buyPrice: map['buyPrice'] as double,
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

class ProductProviderModel {
  final String name;
  int id;
  ProductProviderModel({
    required this.name,
    this.id = 0,
  });

  ProductProviderModel copyWith({
    String? name,
    int? id,
  }) {
    return ProductProviderModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory ProductProviderModel.fromMap(Map<String, dynamic> map) {
    return ProductProviderModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductProviderModel.fromJson(String source) =>
      ProductProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductProvider(name: $name, id: $id)';

  @override
  bool operator ==(covariant ProductProviderModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
