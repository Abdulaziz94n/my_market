import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_dialog_form_field.dart';
import 'package:my_market/core/widgets/shared/app_filter_button.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/app_secondary_button.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class ProductFilterPopupMenu extends ConsumerWidget {
  const ProductFilterPopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    return PopupMenuButton(
      // elevation: 0,
      clipBehavior: Clip.hardEdge,
      constraints: const BoxConstraints(minWidth: 350),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: Sizes.defaultBorderRadius,
        side: BorderSide(width: 1, color: colors.primary),
      ),
      color: colors.white,
      surfaceTintColor: Colors.transparent,
      child: const AppFilterPopupButton(),
      itemBuilder: (context) {
        const verticalSpace = VerticalSpacingWidget(Sizes.p16);
        return [
          PopupMenuItem(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.p16,
                horizontal: Sizes.p16,
              ),
              enabled: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Filtrer Les Resultat',
                    style: context.appTextTheme.titleSmall,
                  ),
                  verticalSpace,
                  AppDialogFormField(
                    title: 'Famille',
                    hint: 'Choisir la Famille',
                  ),
                  verticalSpace,
                  AppDialogFormField(
                    title: 'Stock d\'alert',
                    hint: 'Choisir le nombre de stock',
                  ),
                  verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppDialogFormField(
                          title: 'Prix (Min)',
                          hint: 'Minimum',
                        ),
                      ),
                      const HorizontalSpacingWidget(Sizes.p12),
                      Expanded(
                        child: AppDialogFormField(
                          title: 'Prix (Max)',
                          hint: 'Maximum',
                        ),
                      ),
                    ],
                  ),
                  verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppSecondaryButton(
                          onPressed: () => context.pop(),
                          text: 'Effacer',
                        ),
                      ),
                      const HorizontalSpacingWidget(Sizes.p12),
                      Expanded(
                        child: AppPrimaryButton(
                          onPressed: () {},
                          text: 'Appliquer',
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ];
      },
    );
  }
}
