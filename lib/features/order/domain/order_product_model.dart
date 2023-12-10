// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_market/features/product/domain/product_model.dart';

class OrderProductModel {
  final String id;
  final String name;
  final double price;
  OrderProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  OrderProductModel copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return OrderProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory OrderProductModel.fromMap(Map<String, dynamic> map) {
    return OrderProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  factory OrderProductModel.fromProduct(ProductModel product) {
    return OrderProductModel(
      id: product.id,
      name: product.name,
      price: product.sellPrice,
    );
  }

  @override
  String toString() => 'OrderProductModel(id: $id, name: $name, price: $price)';

  @override
  bool operator ==(covariant OrderProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;
}
