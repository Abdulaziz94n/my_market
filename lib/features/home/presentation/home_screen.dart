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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRail = ref.watch(navigationRailProvider);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {}),
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
