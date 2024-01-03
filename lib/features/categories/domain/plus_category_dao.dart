import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/data_source/abstract_dao.dart';
import 'package:my_market/features/categories/domain/plus_category_entity.dart';
import 'package:my_market/main.dart';
import 'package:objectbox/objectbox.dart';

class CategoryDao implements DAO<PlusCategoryEntity> {
  CategoryDao(this.box);
  final Box<PlusCategoryEntity> box;

  @override
  void add(PlusCategoryEntity data) {
    box.put(data);
  }

  @override
  void delete(id) {}

  @override
  Stream<List<PlusCategoryEntity>> getAll() {
    final res = box
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
    return res;
  }

  @override
  PlusCategoryEntity getOne(int id) {
    return box.get(id)!;
  }

  @override
  void update(PlusCategoryEntity newData) {
    box.put(newData);
  }
}

final categoryDaoProvider = Provider<CategoryDao>((ref) {
  return CategoryDao(objectBox.plusCategoryBox);
});
