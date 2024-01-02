import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/theme/colors_palette_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';

class EditProductDialogActions extends ConsumerWidget {
  const EditProductDialogActions({
    super.key,
    required this.horizontalSpace,
    required this.colors,
    required this.formKey,
    required this.product,
    required this.isValidUpdate,
  });

  final HorizontalSpacingWidget horizontalSpace;
  final AppColorsExtension colors;
  final bool isValidUpdate;
  final GlobalKey<FormState> formKey;
  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        horizontalSpace,
        Expanded(
          child: AppPrimaryButton.icon(
            icon: Icons.add,
            color: colors.warning,
            onPressed: () async {
              print(product.localId);
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (!isValidUpdate) {
                  AppDialogs.warningDialog(
                    backgroundColor: context.appColors.background,
                    context: context,
                    contentText: 'no changes made',
                  );
                  return;
                } else {
                  ref.read(productsController.notifier).editProduct(product);
                }
              }
            },
            text: 'Modifier',
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
