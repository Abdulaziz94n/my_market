import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class CashierProductsTableItems extends ConsumerWidget {
  const CashierProductsTableItems({
    super.key,
    required this.items,
  });
  final List<String> items;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      // TODO: Control later
      shrinkWrap: true,
      itemCount: items.length,
      separatorBuilder: (_, __) => const VerticalSpacingWidget(Sizes.p16),
      itemBuilder: (context, index) => const Row(
        children: [
          Expanded(
              flex: 2,
              child: AppRoundedBox(child: AppText(text: '1234567899'))),
          HorizontalSpacingWidget(Sizes.p8),
          Expanded(
              flex: 3,
              child:
                  AppRoundedBox(child: AppText(text: 'Chocolate Noiro 200 g'))),
          HorizontalSpacingWidget(Sizes.p8),
          Expanded(child: AppRoundedBox(child: AppText(text: '10.00'))),
          HorizontalSpacingWidget(Sizes.p8),
          Expanded(child: AppRoundedBox(child: AppText(text: '37'))),
          HorizontalSpacingWidget(Sizes.p8),
          Expanded(child: AppRoundedBox(child: AppText(text: 'A345B'))),
          HorizontalSpacingWidget(Sizes.p8),
        ],
      ),
    );
  }
}
