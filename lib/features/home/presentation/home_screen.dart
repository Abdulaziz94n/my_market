import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: Builder(builder: (context) {
        final selectedRail = ValueNotifier(NavigationRailType.dashboard);
        return ValueListenableBuilder(
            valueListenable: selectedRail,
            builder: (context, val, child) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppNavigationRail(
                    selectedItem: selectedRail.value,
                    onSelect: (value) => selectedRail.value = value,
                  ),
                  Expanded(
                    child: HomeBody(selectedRail: selectedRail.value),
                  )
                ],
              );
            });
      }),
    );
  }
}
