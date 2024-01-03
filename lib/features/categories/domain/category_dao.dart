import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/data_source/abstract_dao.dart';
import 'package:my_market/features/categories/domain/category_entity.dart';
import 'package:my_market/main.dart';
import 'package:objectbox/objectbox.dart';

class CategoryDao implements DAO<CategoryEntity> {
  CategoryDao(this.box);
  final Box<CategoryEntity> box;

  @override
  void add(CategoryEntity data) {
    box.put(data);
  }

  @override
  void delete(id) {}

  @override
  Stream<List<CategoryEntity>> getAll() {
    final res = box
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
    return res;
  }

  @override
  CategoryEntity getOne(int id) {
    return box.get(id)!;
  }

  @override
  void update(CategoryEntity newData) {
    box.put(newData);
  }
}

final categoryDaoProvider = Provider<CategoryDao>((ref) {
  return CategoryDao(objectBox.categoryBox);
});
