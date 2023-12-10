import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/firestore_extension.dart';
import 'package:my_market/features/categories/domain/category_model.dart';

class CategoriesRepository {
  CategoriesRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<CategoryModel> get _collectionRef {
    return firestore.collection('categories').withConverter<CategoryModel>(
          fromFirestore: (data, options) {
            return CategoryModel.fromMap(data.data()!);
          },
          toFirestore: (data, options) => data.toMap(),
        );
  }

  Stream<List<CategoryModel>> watchCategoryList() {
    return _collectionRef.snapshots().toDataModel();
  }

  Stream<CategoryModel> watchCategory(String id) {
    return _collectionRef.doc(id).snapshots().toDataModel();
  }

  Future<void> addCategory(CategoryModel data) async {
    try {
      await _collectionRef.doc(data.id).set(data);
    } catch (e) {
      throw CustomException(message: 'Error Adding Category');
    }
  }

  Future<void> editCategory(String id, CategoryModel newData) async {
    try {
      await _collectionRef.doc(id).update(newData.toMap());
    } catch (e) {
      throw CustomException(message: 'Error Editing Category');
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _collectionRef.doc(id).delete();
    } catch (e) {
      throw CustomException(message: 'Error Deleting Category');
    }
  }
}

final categoriesRepo = Provider<CategoriesRepository>((ref) {
  return CategoriesRepository(FirebaseFirestore.instance);
});

final watchCategoryList = StreamProvider<List<CategoryModel>>((ref) {
  final repo = ref.read(categoriesRepo);
  return repo.watchCategoryList();
});
