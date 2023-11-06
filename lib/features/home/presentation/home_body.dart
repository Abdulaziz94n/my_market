import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/dashboard_body.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.selectedRail,
  });
  final NavigationRailType selectedRail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (selectedRail) {
      NavigationRailType.dashboard => const DashboardBody(),
      NavigationRailType.store => Center(child: Text(' $selectedRail')),
      NavigationRailType.users => Center(child: Text(' $selectedRail')),
      NavigationRailType.reports => Center(child: Text(' $selectedRail')),
      NavigationRailType.clients => Center(child: Text(' $selectedRail')),
      NavigationRailType.orders => Center(child: Text(' $selectedRail')),
    };
  }
}
