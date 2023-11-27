import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/firestore_extension.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class ProductsRepository {
  ProductsRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<Product> get _collectionRef {
    return firestore.collection('products').withConverter<Product>(
          fromFirestore: (data, options) {
            return Product.fromMap(data.data()!);
          },
          toFirestore: (data, options) => data.toMap(),
        );
  }

  Stream<List<Product>> watchProductList() {
    return _collectionRef.snapshots().toDataModel();
  }

  Stream<Product> watchProduct(String id) {
    return _collectionRef.doc(id).snapshots().toDataModel();
  }

  Future<void> addProduct(Product data) async {
    const categoryId = 'fa074e6b-dfbf-4c8a-9199-9319782b8ec4';
    try {
      data = data.copyWith(categoryId: categoryId);
      await _collectionRef.doc(data.id).set(data);
      await firestore.collection('categories').doc(categoryId).update(
        {'productsCount': FieldValue.increment(1)},
      );
    } catch (e) {
      deleteProduct(data.id, data.categoryId);
      throw CustomException(message: 'Error Adding Product');
    }
  }

  Future<void> editProduct(String id, Product newData) async {
    try {
      await _collectionRef.doc(id).update(newData.toMap());
    } catch (e) {
      throw CustomException(message: 'Error Editing Product');
    }
  }

  Future<void> deleteProduct(String id, String categoryId) async {
    try {
      await _collectionRef.doc(id).delete();
      await firestore.collection('categories').doc(categoryId).update(
        {'productsCount': FieldValue.increment(-1)},
      );
    } catch (e) {
      throw CustomException(message: 'Error Deleting Product');
    }
  }
}

final productsRepo = Provider<ProductsRepository>((ref) {
  return ProductsRepository(FirebaseFirestore.instance);
});

final watchProductListProvider = StreamProvider<List<Product>>((ref) {
  final productsList = ref.read(productsRepo).watchProductList();
  return productsList;
});

final watchProductProvider =
    StreamProvider.autoDispose.family<Product, String>((ref, id) {
  final product = ref.read(productsRepo).watchProduct(id);
  return product;
});
