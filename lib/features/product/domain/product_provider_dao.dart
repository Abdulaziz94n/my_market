import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/data_source/abstract_dao.dart';
import 'package:my_market/features/product/domain/product_provider_entity.dart';
import 'package:my_market/main.dart';
import 'package:objectbox/objectbox.dart';

class ProductProviderLocalDAO implements DAO<ProductProviderEntity> {
  ProductProviderLocalDAO(this.box);
  final Box<ProductProviderEntity> box;

  @override
  void add(data) {
    box.put(data);
  }

  @override
  void delete(id) {
    box.remove(id);
  }

  @override
  ProductProviderEntity getOne(int id) {
    final res = box.get(id);
    return res!;
  }

  @override
  Stream<List<ProductProviderEntity>> getAll() {
    final res = box.query().watch(triggerImmediately: true);
    return res.map((event) => event.find());
  }

  @override
  void update(ProductProviderEntity newData) {
    box.put(newData, mode: PutMode.put);
  }
}

final productLocalDaoProvider = Provider<ProductProviderLocalDAO>((ref) {
  return ProductProviderLocalDAO(objectBox.productProviderBox);
});
