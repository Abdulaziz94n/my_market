import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/dashboard/presentation/dashboard_body.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/product/presentation/stock_products_body.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.selectedRail,
    required this.railDestination,
  });
  final NavigationRailType selectedRail;
  final RailDestination railDestination;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (railDestination) {
      RailDestination.dashboard => const DashboardBody(),
      RailDestination.stockProduct => const ProductsTabBody(),
      RailDestination.stockPerte => Center(
          child: Text(' $railDestination'),
        ),
      RailDestination.clientsOnCredit =>
        Center(child: Text(' $railDestination')),
      RailDestination.clientsCompany =>
        Center(child: Text(' $railDestination')),
      RailDestination.clientsHistory =>
        Center(child: Text(' $railDestination')),
      RailDestination.settings => Center(
          child: Text(' $railDestination'),
        ),
      RailDestination.reports => Center(child: Text(' $railDestination')),
      RailDestination.users => Center(child: Text(' $railDestination')),
      RailDestination.cashier => Center(child: Text(' $railDestination')),
    };
  }
}
