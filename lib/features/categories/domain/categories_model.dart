class CategoryModel {
  CategoryModel({
    required this.name,
    required this.productsCount,
  });

  final String name;
  final int productsCount;

  CategoryModel copyWith({
    String? name,
    int? productsCount,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      productsCount: productsCount ?? this.productsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'productsCount': productsCount,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] ?? '',
      productsCount: map['productsCount']?.toInt() ?? 0,
    );
  }

  @override
  String toString() =>
      'CategoryModel(name: $name, productsCount: $productsCount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.name == name &&
        other.productsCount == productsCount;
  }

  @override
  int get hashCode => name.hashCode ^ productsCount.hashCode;
}
