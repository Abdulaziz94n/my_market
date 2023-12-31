import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/theme/colors_palette_extension.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class AddProductDialogActions extends ConsumerWidget {
  const AddProductDialogActions({
    super.key,
    required this.horizontalSpace,
    required this.colors,
    required this.product,
    required this.onAdd,
  });

  final HorizontalSpacingWidget horizontalSpace;
  final AppColorsExtension colors;
  final ProductModel product;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        horizontalSpace,
        Expanded(
          child: AppPrimaryButton.icon(
            icon: Icons.add,
            color: colors.success,
            onPressed: onAdd,
            text: 'Enregistrer',
          ),
        ),
        horizontalSpace,
        Expanded(
          child: AppPrimaryButton.icon(
            icon: Icons.close,
            color: colors.error,
            onPressed: () => context.pop(),
            text: 'Annuler',
          ),
        ),
        horizontalSpace,
        Expanded(
          child: AppPrimaryButton.icon(
            icon: Icons.close,
            onPressed: () {},
            text: 'Imprimer le prix',
          ),
        ),
        horizontalSpace,
        Expanded(
          child: AppPrimaryButton.icon(
            icon: Icons.close,
            text: 'Imprimer le QR',
            onPressed: () {},
          ),
        ),
        horizontalSpace,
      ],
    );
  }
}
