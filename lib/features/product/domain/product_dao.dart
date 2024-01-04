import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/data_source/abstract_dao.dart';
import 'package:my_market/features/product/domain/product_entity.dart';
import 'package:my_market/main.dart';
import 'package:objectbox/objectbox.dart';

class ProductLocalDAO implements DAO<ProductEntity> {
  ProductLocalDAO(this.box);
  final Box<ProductEntity> box;

  @override
  void add(data) {
    box.put(data);
  }

  @override
  void delete(id) {
    box.remove(id);
  }

  @override
  ProductEntity getOne(int id) {
    final res = box.get(id);
    return res!;
  }

  @override
  Stream<List<ProductEntity>> getAll() {
    final query = box.query().watch(triggerImmediately: true);
    final res = query.map((event) => event.find());
    return res;
  }

  @override
  void update(ProductEntity newData) {
    box.put(newData, mode: PutMode.put);
  }
}

final productLocalDaoProvider = Provider<ProductLocalDAO>((ref) {
  return ProductLocalDAO(objectBox.productBox);
});
