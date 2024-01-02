import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/product/domain/product_dao.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class ProductsRepository {
  ProductsRepository(this.productLocalDao);
  final ProductLocalDAO productLocalDao;

  void addProduct(ProductModel product) {
    productLocalDao.add(product.toEntity());
  }

  ProductModel getOne(int id) {
    final res = ProductModel.fromEntity(productLocalDao.getOne(id));
    return res;
  }

  Stream<List<ProductModel>> getAll() {
    final res = productLocalDao
        .getAll()
        .map((e) => e.map((e) => ProductModel.fromEntity(e)).toList());
    return res;
  }

  void editProduct(ProductModel newData) {
    productLocalDao.update(newData.toEntity());
  }

  void deleteProduct(int id) {
    productLocalDao.delete(id);
  }
}

final productsRepo = Provider<ProductsRepository>((ref) {
  return ProductsRepository(ref.watch(productLocalDaoProvider));
});

final productsStreamProvider = StreamProvider<List<ProductModel>>((ref) {
  return ref.watch(productsRepo).getAll();
});













/**
 * class ProductsRepository {
  ProductsRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<ProductModel> get _collectionRef {
    return firestore.collection('products').withConverter<ProductModel>(
          fromFirestore: (data, options) {
            return ProductModel.fromMap(data.data()!);
          },
          toFirestore: (data, options) => data.toMap(),
        );
  }

  Stream<List<ProductModel>> watchProductList() {
    return _collectionRef.snapshots().toDataModel();
  }

  Stream<List<ProductModel>> watchCategoryProducts(int categoryId) {
    return _collectionRef
        .where('categoryId', isEqualTo: categoryId)
        .snapshots()
        .toDataModel();
  }

  Stream<ProductModel> watchProduct(String id) {
    return _collectionRef.doc(id).snapshots().toDataModel();
  }

  Future<void> addProduct(ProductModel data) async {
    // try {
    //   data = data.copyWith(categoryId: data.categoryId);
    //   await _collectionRef.doc(data.id).set(data);
    //   await firestore.collection('categories').doc(data.categoryId).update(
    //     {'productsCount': FieldValue.increment(1)},
    //   );
    // } catch (e) {
    //   deleteProduct(data.id, data.categoryId);
    //   throw CustomException(message: 'Error Adding Product');
    // }
  }

  Future<void> editProduct(String id, ProductModel newData) async {
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

final watchProductListProvider = StreamProvider<List<ProductModel>>((ref) {
  final productsList = ref.read(productsRepo).watchProductList();
  return productsList;
});

final watchProductProvider =
    StreamProvider.autoDispose.family<ProductModel, String>((ref, id) {
  final product = ref.read(productsRepo).watchProduct(id);
  return product;
});

final watchCategoryProducts = StreamProvider.family
    .autoDispose<List<ProductModel>, int>((ref, categoryId) {
  final categoryProducts = ref.read(productsRepo).watchCategoryProducts(
        categoryId,
      );
  return categoryProducts;
});

 */