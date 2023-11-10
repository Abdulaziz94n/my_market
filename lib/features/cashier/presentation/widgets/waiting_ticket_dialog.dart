import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class WaitingTicketDialog extends ConsumerWidget {
  const WaitingTicketDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: 'Ticket d\'attente',
          style: context.appTextTheme.titleMedium,
        ),
        const VerticalSpacingWidget(Sizes.p8),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: AppRoundedBox(
                color: colors.active,
                child: const AppText(text: 'Reference N'),
              ),
            ),
            const HorizontalSpacingWidget(Sizes.p8),
            Expanded(
              flex: 2,
              child: AppRoundedBox(
                color: colors.active,
                child: const AppText(text: 'Totals'),
              ),
            ),
          ],
        ),
        const VerticalSpacingWidget(Sizes.p8),
        for (int i = 0; i <= 5; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppRoundedBox(
                    color: colors.background,
                    child: const AppText(text: ''),
                  ),
                ),
                const HorizontalSpacingWidget(Sizes.p8),
                Expanded(
                  flex: 2,
                  child: AppRoundedBox(
                    color: colors.background,
                    child: const AppText(text: ''),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
