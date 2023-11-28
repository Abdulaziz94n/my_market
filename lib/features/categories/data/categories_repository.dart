import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/firestore_extension.dart';
import 'package:my_market/features/categories/domain/category_model.dart';

class CategoriesRepository {
  CategoriesRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<Category> get _collectionRef {
    return firestore.collection('categories').withConverter<Category>(
          fromFirestore: (data, options) {
            return Category.fromMap(data.data()!);
          },
          toFirestore: (data, options) => data.toMap(),
        );
  }

  Stream<List<Category>> watchCategoryList() {
    return _collectionRef.snapshots().toDataModel();
  }

  Stream<Category> watchCategory(String id) {
    return _collectionRef.doc(id).snapshots().toDataModel();
  }

  Future<void> addCategory(Category data) async {
    try {
      print(data.id);
      await _collectionRef.doc(data.id).set(data);
    } catch (e) {
      throw CustomException(message: 'Error Adding Category');
    }
  }

  Future<void> editCategory(String id, Category newData) async {
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

final watchCategoryList = StreamProvider<List<Category>>((ref) {
  final repo = ref.read(categoriesRepo);
  return repo.watchCategoryList();
});
