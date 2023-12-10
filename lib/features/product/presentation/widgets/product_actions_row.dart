import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_action_button.dart';
import 'package:my_market/core/widgets/shared/app_actions_row.dart';
import 'package:my_market/features/product/presentation/widgets/add_product_dialog.dart';
import 'package:my_market/features/product/presentation/widgets/edit_product_dialog.dart';
import 'package:my_market/features/product/presentation/widgets/product_details_dialog.dart';

class ProductsActionRow extends HookConsumerWidget {
  const ProductsActionRow({
    super.key,
    required this.showActions,
    required this.searchCtrl,
    required this.onSearch,
  });
  final TextEditingController searchCtrl;
  final ValueNotifier<bool> showActions;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final searchCtrl = useTextEditingController();
    return AppActionsRow(
      searchCtrl: searchCtrl,
      onSearch: onSearch,
      actions: [
        AppActionButton(
          color: colors.success,
          onPressed: () => AppDialogs.customDialog(
            context: context,
            dialog: const AddProductDialog(),
          ),
          iconData: Icons.add,
          text: 'Ajouter',
        ),
        AppActionButton(
          color: colors.blue,
          onPressed: () => AppDialogs.customDialog(
            context: context,
            dialog: const ProductDetailsDialog(),
          ),
          iconData: Icons.remove_red_eye_sharp,
          text: 'Vair la produit',
        ),
        AppActionButton(
          color: colors.warning,
          onPressed: () => AppDialogs.customDialog(
            context: context,
            dialog: EditProductDialog(
              product: DummyData.product,
            ),
          ),
          iconData: Icons.edit,
          text: 'Modifier',
        ),
        AppActionButton(
          color: colors.error,
          onPressed: () => AppDialogs.warningDialog(
              context: context,
              icon: Icons.delete,
              contentText: 'Are you sure you want to delete this product ?',
              onAction: () {
                print('product deleted');
                context.pop();
              }),
          iconData: Icons.close,
          text: 'Supprimer',
        ),
        AppActionButton(
          color: colors.blue,
          onPressed: () {},
          iconData: Icons.arrow_drop_up,
          text: 'Importer',
        ),
        AppActionButton(
          color: colors.blue,
          onPressed: () {},
          iconData: Icons.arrow_drop_down,
          text: 'Exporter',
        ),
      ],
      showActions: showActions,
      onChanged: (value) => showActions.value = value,
    );
  }
}
