import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/firestore_extension.dart';
import 'package:my_market/features/categories/domain/categories_model.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class CategoriesRepository {
  CategoriesRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<Category> get _categoriesCollection =>
      firestore.collection('categories').withConverter<Category>(
            fromFirestore: (data, options) {
              return Category.fromMap(data.data()!);
            },
            toFirestore: (data, options) => data.toMap(),
          );

  Stream<List<Category>> watchCategories() {
    return _categoriesCollection.snapshots().toDataModel();
  }

  Stream<Product> watchCategory(String id) {
    return _docRef(id).snapshots().map((event) => event.data()!);
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final data = await _categoriesCollection.get();
      return data.toDataModel();
    } catch (e) {
      throw CustomException(message: 'Something went wrong');
    }
  }

  DocumentReference<Product> _docRef(String id) =>
      firestore.collection('products').doc(id).withConverter<Product>(
            fromFirestore: (data, options) {
              return Product.fromMap(data.data()!);
            },
            toFirestore: (data, options) => data.toMap(),
          );
}

final categoriesRepo = Provider<CategoriesRepository>((ref) {
  return CategoriesRepository(FirebaseFirestore.instance);
});
