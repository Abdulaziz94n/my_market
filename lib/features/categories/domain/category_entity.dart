// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_market/features/product/domain/product_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryEntity {
  int id;
  int productsCount;
  final String name;
  final String createdBy;
  final String globalId;
  final DateTime createdAt;

  @Backlink('category')
  final products = ToMany<ProductEntity>();

  CategoryEntity({
    this.id = 0,
    this.productsCount = 0,
    required this.name,
    required this.globalId,
    required this.createdBy,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'CategoryEntity(id: $id, productsCount: $productsCount, name: $name, createdBy: $createdBy, globalId: $globalId, createdAt: $createdAt)';
  }
}
