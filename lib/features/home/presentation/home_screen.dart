import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRail = ref.watch(navigationRailProvider);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const MyHomePage()));
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
