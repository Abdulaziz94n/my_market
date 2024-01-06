// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/async_value_widget.dart';
import 'package:my_market/features/auth/presentation/auth_controller.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/client/data/credit_client_repository.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';
import 'package:my_market/features/home/presentation/widgets/app_navigation_rail.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_dao.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';
import 'package:my_market/features/users/domain/user_role_enum.dart';
import 'package:my_market/main.dart';
import 'package:my_market/objectbox.g.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRail = ref.watch(navigationRailProvider);
    final selectedDestination = useState(RailDestination.dashboard);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // resetCategories();
          // resetProductsDb();
          // final res = await ref.read(categoryRepo).getAll().first;
          // print(res.length);
          print('Category = ${objectBox.categoryBox.get(1)}');
          print('TOTAL PROD = ${objectBox.categoryBox.get(1)?.products}');
          // print(res);
          // objectBox.productBox.removeAll();
        },
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedDestination.value != RailDestination.cashier)
            AppNavigationRail(
              selectedRail: selectedRail,
              onRailSelect: (value) =>
                  ref.read(navigationRailProvider.notifier).setTab(value),
              selectedDestination: selectedDestination.value,
              onDestinationSelect: (destination) =>
                  selectedDestination.value = destination,
            ),
          Expanded(
            child: HomeBody(
              selectedRail: selectedRail,
              railDestination: selectedDestination.value,
              onPop: () =>
                  selectedDestination.value = RailDestination.dashboard,
            ),
          ),
        ],
      ),
    );
  }
}
