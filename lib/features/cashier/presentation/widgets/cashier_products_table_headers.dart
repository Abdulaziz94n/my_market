import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class CashierProductsTableHeaders extends StatelessWidget {
  const CashierProductsTableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    const horizontalSpace = HorizontalSpacingWidget(Sizes.p8);
    return DefaultTextStyle(
      style: context.appTextTheme.bodyMedium!.colorize(colors.primary).bold,
      child: const Row(
        children: [
          Expanded(
              flex: 2, child: AppRoundedBox(child: AppText(text: 'Code bare'))),
          horizontalSpace,
          Expanded(
              flex: 3,
              child: AppRoundedBox(child: AppText(text: 'Nom d\'article'))),
          horizontalSpace,
          Expanded(child: AppRoundedBox(child: AppText(text: 'Prix'))),
          horizontalSpace,
          Expanded(child: AppRoundedBox(child: AppText(text: 'Stocke'))),
          horizontalSpace,
          Expanded(child: AppRoundedBox(child: AppText(text: 'Code'))),
          horizontalSpace,
        ],
      ),
    );
  }
}
