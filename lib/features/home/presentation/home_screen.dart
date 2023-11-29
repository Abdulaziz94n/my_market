// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRail = ref.watch(navigationRailProvider);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        print(ref.read(watchCategoryList).requireValue.length);
        // ref.read(categoriesRepo).addCategory(DummyData.category);
        // ref.read(productsController.notifier).addProduct(Product(
        //     id: const Uuid().v4(),
        //     name: 'test 1',
        //     desc: 'desc',
        //     barcode: '123456',
        //     shortCode: '123',
        //     categoryId: '262f843f-0f3a-44d4-b397-6941470a91db',
        //     sellPrice: 15,
        //     alertCount: 10,
        //     providersDetails: ProvidersDetails(
        //       buyPrice: 10,
        //       providerName: DummyData.productProviders[0],
        //     ),
        //     createdBy: DummyData.usersList[0].id,
        //     createdAt: null,
        //     stockCount: 10));
      }),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedRail != NavigationRailType.cashier)
            AppNavigationRail(
              selectedItem: selectedRail,
              onSelect: (value) =>
                  ref.read(navigationRailProvider.notifier).setTab(value),
            ),
          Expanded(
            child: HomeBody(
              selectedRail: selectedRail,
            ),
          )
        ],
      ),
    );
  }
}
