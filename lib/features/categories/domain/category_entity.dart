import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryEntity {
  int id;
  int productsCount;
  final String name;
  final String createdBy;
  final String globalId;
  final DateTime createdAt;
  CategoryEntity({
    this.id = 0,
    this.productsCount = 0,
    required this.name,
    required this.globalId,
    required this.createdBy,
    required this.createdAt,
  });
}
