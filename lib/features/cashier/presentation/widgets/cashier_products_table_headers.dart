import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class CashierProductsTableHeaders extends StatelessWidget {
  const CashierProductsTableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            flex: 2, child: AppRoundedBox(child: AppText(text: 'Code bare'))),
        HorizontalSpacingWidget(Sizes.p8),
        Expanded(
            flex: 3,
            child: AppRoundedBox(child: AppText(text: 'Nom d\'article'))),
        HorizontalSpacingWidget(Sizes.p8),
        Expanded(child: AppRoundedBox(child: AppText(text: 'Prix'))),
        HorizontalSpacingWidget(Sizes.p8),
        Expanded(child: AppRoundedBox(child: AppText(text: 'Stocke'))),
        HorizontalSpacingWidget(Sizes.p8),
        Expanded(child: AppRoundedBox(child: AppText(text: 'Code'))),
        HorizontalSpacingWidget(Sizes.p8),
      ],
    );
  }
}
