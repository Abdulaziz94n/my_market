import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class ProductsController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> addProduct(ProductModel product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(productsRepo).addProduct(product),
    );
  }

  Future<void> editProduct(String id, ProductModel newProduct) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(productsRepo).editProduct(id, newProduct),
    );
  }

  Future<void> deleteProdcut(String id, String categoryId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(productsRepo).deleteProduct(id, categoryId),
    );
  }
}

final productsController =
    AsyncNotifierProvider<ProductsController, void>(ProductsController.new);
