import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/product/domain/scale_product_dao.dart';
import 'package:my_market/features/product/domain/scale_product_model.dart';

class ScaleProductsRepository {
  ScaleProductsRepository(this.productLocalDao);
  final ScaleProductDao productLocalDao;

  void addProduct(ScaleProductModel product) {
    productLocalDao.add(product.toEntity());
  }

  ScaleProductModel getOne(int id) {
    final res = ScaleProductModel.fromEntity(productLocalDao.getOne(id));
    return res;
  }

  Stream<List<ScaleProductModel>> getAll() {
    final res = productLocalDao
        .getAll()
        .map((e) => e.map((e) => ScaleProductModel.fromEntity(e)).toList());
    return res;
  }

  void editProduct(ScaleProductModel newData) {
    productLocalDao.update(newData.toEntity());
  }

  void deleteProduct(int id) {
    productLocalDao.delete(id);
  }
}

final productsRepo = Provider<ScaleProductsRepository>((ref) {
  return ScaleProductsRepository(ref.watch(scaleProductDao));
});

final scaleProductsStream = StreamProvider<List<ScaleProductModel>>((ref) {
  return ref.watch(productsRepo).getAll();
});
