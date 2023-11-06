import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_card.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products.dart';

class CashierScreen extends ConsumerWidget {
  const CashierScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppScaffold(
        withBackgroundShape: false,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CashierCard()),
            Expanded(child: CashierProducts()),
          ],
        ));
  }
}
