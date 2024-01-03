import 'package:objectbox/objectbox.dart';

@Entity()
class PlusCategoryEntity {
  int id;
  String globalId;
  String name;
  int productsCount;
  DateTime? createdAt;
  String createdBy;

  PlusCategoryEntity({
    this.id = 0,
    this.productsCount = 0,
    this.createdAt,
    required this.globalId,
    required this.name,
    required this.createdBy,
  });
}
