import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class ClientListDialog extends ConsumerWidget {
  const ClientListDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    return Padding(
      padding: Sizes.defaultDialogPadding,
      child: SizedBox(
        width: Sizes.defaultDialogWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: 'Liste de clients',
              style: context.appTextTheme.titleMedium,
            ),
            const VerticalSpacingWidget(Sizes.p8),
            Row(
              children: [
                Expanded(
                  child: AppRoundedBox(
                    color: colors.active,
                    child: const AppText(text: 'Code'),
                  ),
                ),
                const HorizontalSpacingWidget(Sizes.p8),
                Expanded(
                  flex: 3,
                  child: AppRoundedBox(
                    color: colors.active,
                    child: const AppText(text: 'User Name'),
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
                      child: AppRoundedBox(
                        color: colors.background,
                        child: const AppText(text: '1062'),
                      ),
                    ),
                    const HorizontalSpacingWidget(Sizes.p8),
                    Expanded(
                      flex: 3,
                      child: AppRoundedBox(
                        color: colors.background,
                        child: AppText(text: 'Afrah Mimouna ' * 2),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
