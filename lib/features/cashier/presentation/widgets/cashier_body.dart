import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_card.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products.dart';

class CashierBody extends ConsumerWidget {
  const CashierBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: CashierCard()),
        Expanded(flex: 3, child: CashierProducts()),
      ],
    );
  }
}
