import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class ProductsController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  void addProduct(ProductModel product) {
    ref.read(productsRepo).addProduct(product);
  }

  void editProduct(ProductModel newProduct) {
    ref.read(productsRepo).editProduct(newProduct);
  }

  void deleteProdcut(int id) {
    ref.read(productsRepo).deleteProduct(id);
  }
}

final productsController =
    AsyncNotifierProvider<ProductsController, void>(ProductsController.new);
