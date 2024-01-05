import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/product/domain/product_provider_dao.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';

class ProductProviderRepository {
  ProductProviderRepository(this.productLocalDao);
  final ProductProviderLocalDAO productLocalDao;

  void addProvider(ProductProviderModel product) {
    productLocalDao.add(product.toEntity());
  }

  ProductProviderModel getOne(int id) {
    final res = ProductProviderModel.fromEntity(productLocalDao.getOne(id));
    return res;
  }

  Stream<List<ProductProviderModel>> getAll() {
    final res = productLocalDao
        .getAll()
        .map((e) => e.map((e) => ProductProviderModel.fromEntity(e)).toList());
    return res;
  }

  void editProvider(ProductProviderModel newData) {
    productLocalDao.update(newData.toEntity());
  }

  void deleteProvider(int id) {
    productLocalDao.delete(id);
  }
}

final productProviderRepo = Provider<ProductProviderRepository>((ref) {
  return ProductProviderRepository(ref.watch(productLocalDaoProvider));
});

final productsStreamProvider =
    StreamProvider<List<ProductProviderModel>>((ref) {
  return ref.watch(productProviderRepo).getAll();
});
