import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/features/cashier/presentation/widgets/order_actions.dart';
import 'package:my_market/features/cashier/presentation/widgets/order_content.dart';

class CashierCard extends ConsumerWidget {
  const CashierCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: Sizes.defaultBorderRadius,
            child: const Card(
              margin: EdgeInsets.zero,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: OrderContent()),
                    OrderActions(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
