import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/data_source/abstract_dao.dart';
import 'package:my_market/features/product/domain/scale_product_entity.dart';
import 'package:my_market/main.dart';
import 'package:my_market/objectbox.g.dart';

class ScaleProductDao implements DAO<ScaleProductEntity> {
  ScaleProductDao(this.box);
  final Box<ScaleProductEntity> box;
  @override
  void add(ScaleProductEntity data) {}

  @override
  void delete(int id) {
    box.remove(id);
  }

  @override
  Stream<List<ScaleProductEntity>> getAll() {
    return box
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  @override
  ScaleProductEntity getOne(int id) {
    return box.get(id)!;
  }

  @override
  void update(ScaleProductEntity newData) {
    box.put(newData);
  }
}

final scaleProductDao = Provider<ScaleProductDao>((ref) {
  return ScaleProductDao(objectBox.scaleProductBox);
});
