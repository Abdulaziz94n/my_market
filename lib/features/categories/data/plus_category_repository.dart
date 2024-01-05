import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/categories/domain/plus_category_dao.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';
import 'package:my_market/main.dart';

class PlusCategoriesRepository {
  PlusCategoriesRepository(this.plusCategoryDao);
  final PlusCategoryDao plusCategoryDao;

  Stream<List<PlusCategoryModel>> getAll() {
    return plusCategoryDao.getAll().map((entities) =>
        entities.map((e) => PlusCategoryModel.fromEntity(e)).toList());
  }

  PlusCategoryModel getOne(int id) {
    final res = PlusCategoryModel.fromEntity(plusCategoryDao.getOne(id));
    return res;
  }

  void addCategory(PlusCategoryModel data) async {
    plusCategoryDao.add(data.toEntity());
  }

  void editCategory(PlusCategoryModel newData) {
    plusCategoryDao.update(newData.toEntity());
  }

  void deleteCategory(int id) async {
    plusCategoryDao.delete(id);
  }
}

final plusCategoryRepo = Provider<PlusCategoriesRepository>((ref) {
  return PlusCategoriesRepository(PlusCategoryDao(objectBox.plusCategoryBox));
});

final watchCategoryList = StreamProvider<List<PlusCategoryModel>>((ref) {
  final repo = ref.read(plusCategoryRepo);
  return repo.getAll();
});
