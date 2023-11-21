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
    try {
      await _collectionRef.add(data);
    } catch (e) {
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

  Future<void> deleteProduct(String id) async {
    try {
      await _collectionRef.doc(id).delete();
    } catch (e) {
      throw CustomException(message: 'Error Deleting Product');
    }
  }
}

final productsRepo = Provider<ProductsRepository>((ref) {
  return ProductsRepository(FirebaseFirestore.instance);
});
