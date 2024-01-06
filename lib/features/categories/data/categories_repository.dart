import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/categories/domain/category_dao.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/main.dart';

class CategoriesRepository {
  CategoriesRepository(this.categoryDao);
  final CategoryDao categoryDao;

  Stream<List<CategoryModel>> getAll() {
    return categoryDao.getAll().map((entities) =>
        entities.map((e) => CategoryModel.fromEntity(e)).toList());
  }

  CategoryModel getOne(int id) {
    final res = CategoryModel.fromEntity(categoryDao.getOne(id));
    return res;
  }

  void addCategory(CategoryModel data) async {
    categoryDao.add(data.toEntity());
  }

  void editCategory(CategoryModel newData) {
    categoryDao.update(newData.toEntity());
  }

  void deleteCategory(int id) async {
    categoryDao.delete(id);
  }
}

final categoryRepo = Provider<CategoriesRepository>((ref) {
  return CategoriesRepository(CategoryDao(objectBox.categoryBox));
});

final categoryStreamProvider = StreamProvider<List<CategoryModel>>((ref) {
  final repo = ref.read(categoryRepo);
  return repo.getAll();
});
