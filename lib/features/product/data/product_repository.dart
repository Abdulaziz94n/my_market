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
