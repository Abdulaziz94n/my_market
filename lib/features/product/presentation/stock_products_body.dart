import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_filter_button.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field_bordered.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/presentation/widgets/add_product_dialog.dart';
import 'package:my_market/features/product/presentation/widgets/edit_product_dialog.dart';
import 'package:my_market/features/product/presentation/widgets/product_details_dialog.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ProductsTabBody extends HookConsumerWidget {
  const ProductsTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final showActions = useState(false);
    const horizontalSpacing = HorizontalSpacingWidget(Sizes.p12);

    return AppMainBody(
      title: 'Stocke & Produits',
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.attach_money,
                title: '1,560,236.03 MAD',
                subTitle: 'Totals de Stocks',
              ),
            ),
            horizontalSpacing,
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.refresh,
                title: '75 Produits',
                subTitle: 'Stock d\'alert',
              ),
            ),
            horizontalSpacing,
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.attach_money,
                title: '100 Produits',
                subTitle: 'Produits Finis',
              ),
            ),
            horizontalSpacing,
            Expanded(
              child: AppPrimaryCard(
                icon: Icons.attach_money,
                title: '2500 Produits',
                subTitle: 'Total de Produits',
              ),
            ),
          ],
        ),
        const VerticalSpacingWidget(Sizes.p16),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p8),
                child: Column(
                  children: [
                    _ActionsRow(
                      showActions: showActions.value,
                      onChanged: (value) => showActions.value = value,
                    ),
                    Expanded(
                      child: ScrollableTableView(
                        headerBackgroundColor: colors.grey,
                        headers: const [
                          TableViewHeader(
                            label: 'label',
                          )
                        ],
                        rows: [
                          TableViewRow(
                            cells: [
                              TableViewCell(
                                child: Radio(
                                  value: 'groupValue',
                                  groupValue: 'groupValue',
                                  onChanged: (value) {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ActionsRow extends HookConsumerWidget {
  const _ActionsRow({
    required this.showActions,
    required this.onChanged,
  });
  final bool showActions;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final searchCtrl = useTextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 200,
              child: AppBorderedTextField(
                controller: searchCtrl,
                hintText: 'Recherche id, Name, Codebar...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const HorizontalSpacingWidget(Sizes.p8),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: colors.onPrimary,
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              InkWell(
                onTap: () => onChanged(!showActions),
                child: Icon(
                  Icons.settings,
                  color: showActions ? colors.primary : colors.onPrimary,
                ),
              ),
              const HorizontalSpacingWidget(Sizes.p8),
              if (!showActions) AppFilterButton(onPressed: () {}),
              if (showActions)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colors.success),
                            onPressed: () => AppDialogs.customDialog(
                              context: context,
                              dialog: const AddProductDialog(),
                            ),
                            icon: const Icon(Icons.add),
                            label: const AppText(text: 'Ajouter'),
                          ),
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                            onPressed: () => AppDialogs.customDialog(
                              context: context,
                              dialog: const ProductDetailsDialog(),
                            ),
                            icon: const Icon(Icons.remove_red_eye_sharp),
                            label: const AppText(text: 'Vair la produit'),
                          ),
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.warning,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                            onPressed: () => AppDialogs.customDialog(
                              context: context,
                              dialog: EditProductDialog(
                                product: DummyData.product,
                              ),
                            ),
                            icon: const Icon(Icons.edit),
                            label: const AppText(text: 'Modifier'),
                          ),
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.error,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                            onPressed: () => AppDialogs.warningDialog(
                                context: context,
                                icon: Icons.delete,
                                contentText:
                                    'Are you sure you want to delete this product ?',
                                onAction: () {
                                  print('product deleted');
                                  context.pop();
                                }),
                            icon: const Icon(Icons.close),
                            label: const AppText(text: 'Supprimer'),
                          ),
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_up),
                            label: const AppText(text: 'Importer'),
                          ),
                          const HorizontalSpacingWidget(Sizes.p4),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down),
                            label: const AppText(text: 'Exporter'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
