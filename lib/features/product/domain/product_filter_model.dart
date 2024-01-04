// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_market/features/categories/domain/category_model.dart';

class ProductFilter {
  final int? minPrice;
  final int? maxPrice;
  final int? alertCount;
  final CategoryModel? category;
  ProductFilter({
    this.minPrice,
    this.maxPrice,
    this.alertCount,
    this.category,
  });

  ProductFilter copyWith({
    int? minPrice,
    int? maxPrice,
    int? alertCount,
    CategoryModel? category,
  }) {
    return ProductFilter(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      alertCount: alertCount ?? this.alertCount,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'ProductFilter(minPrice: $minPrice, maxPrice: $maxPrice, alertCount: $alertCount, category: $category)';
  }

  @override
  bool operator ==(covariant ProductFilter other) {
    if (identical(this, other)) return true;

    return other.minPrice == minPrice &&
        other.maxPrice == maxPrice &&
        other.alertCount == alertCount &&
        other.category == category;
  }

  @override
  int get hashCode {
    return minPrice.hashCode ^
        maxPrice.hashCode ^
        alertCount.hashCode ^
        category.hashCode;
  }
}
