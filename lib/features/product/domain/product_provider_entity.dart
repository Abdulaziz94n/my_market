import 'package:objectbox/objectbox.dart';

@Entity()
class ProductProviderEntity {
  int id;
  final String name;
  final String globalId;
  final DateTime? createdAt;
  final String createdBy;
  ProductProviderEntity({
    this.id = 0,
    required this.name,
    required this.globalId,
    required this.createdAt,
    required this.createdBy,
  });
}
