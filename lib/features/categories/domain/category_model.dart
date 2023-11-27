// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.name,
    this.productsCount = 0,
  });

  final String id;
  final String name;
  final int? productsCount;

  Category copyWith({
    String? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'productsCount': productsCount,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      name: map['name'] as String,
      productsCount: map['productsCount'] as int,
    );
  }

  @override
  String toString() =>
      'Category(id: $id, name: $name, productsCount: $productsCount)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.productsCount == productsCount;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ productsCount.hashCode;

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
