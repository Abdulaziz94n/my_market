import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_body.dart';
import 'package:my_market/features/client/presentation/clients_history_tab_body.dart';
import 'package:my_market/features/client/presentation/company_client_tab_body.dart';
import 'package:my_market/features/client/presentation/credit_client_tab_body.dart';
import 'package:my_market/features/dashboard/presentation/dashboard_body.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/product/presentation/stock_products_body.dart';
import 'package:my_market/features/users/presentation/old_users_tab_body.dart';
import 'package:my_market/features/users/presentation/users_tab_body.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.selectedRail,
    required this.railDestination,
    this.onPop,
  });
  final NavigationRailType selectedRail;
  final RailDestination railDestination;
  final VoidCallback? onPop;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (railDestination) {
      RailDestination.dashboard => const DashboardBody(),
      RailDestination.stockProduct => const ProductsTabBody(),
      RailDestination.stockPerte => Center(child: Text(' $railDestination')),
      RailDestination.clientsOnCredit => const CreditClientTabBody(),
      RailDestination.clientsCompany => const CompanyClientTabBody(),
      RailDestination.clientsHistory => const ClientHistoryTabBody(),
      RailDestination.settings => Center(child: Text(' $railDestination')),
      RailDestination.reports => Center(child: Text(' $railDestination')),
      RailDestination.users => const UsersTabBody(),
      RailDestination.oldUsers => const OldUsersTabBody(),
      RailDestination.cashier => CashierBody(onPop: onPop),
    };
  }
}
