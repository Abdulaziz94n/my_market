import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';

class DashboardBody extends ConsumerWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppMainBody(
      children: [
        Row(
          children: [
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.point_of_sale,
                title: '14,505.40 MAD',
                subTitle: 'Totals De Vente',
                onTap: () {},
              ),
            ),
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.shopping_bag_sharp,
                title: '14,505.40 MAD',
                subTitle: 'Espèces',
                onTap: () {},
              ),
            ),
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.attach_money,
                title: '14,505.40 MAD',
                subTitle: 'TPE',
                onTap: () {},
              ),
            ),
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.shopping_cart_rounded,
                title: '2,500 Produit',
                subTitle: 'Stocke',
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
