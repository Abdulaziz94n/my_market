import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/reusables/traingle_painter.dart';
import 'package:my_market/core/widgets/shared/app_bordered_text_field.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products_table.dart';
import 'package:my_market/features/cashier/presentation/widgets/count_selector.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';
import 'package:my_market/features/order/presentation/order_item_controller.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class CashierProducts extends StatefulHookConsumerWidget {
  const CashierProducts({
    super.key,
    required this.onProductSelect,
    required this.selectedProduct,
    required this.selectedCategory,
    required this.onCategorySelect,
  });
  final ValueChanged<Product> onProductSelect;
  final ValueChanged<Category> onCategorySelect;
  final Product? selectedProduct;
  final Category? selectedCategory;
  @override
  ConsumerState<CashierProducts> createState() => _CashierProductsState();
}

class _CashierProductsState extends ConsumerState<CashierProducts> {
  final _counterSelectorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final selectedOrder = ref.watch(selectedOrderItem);
    final showCountSelector = selectedOrder != null;
    const traingleSide = 25.0;
    return LayoutBuilder(builder: (context, c) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            SizedBox(
              width: c.maxWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const AppText(text: '13 : 30 : 55 | 05 . Jan . 2023'),
                  Positioned(
                      right: 0,
                      child: AppText.clickable(
                        text: 'Retour au menu',
                        onClick: () => ref
                            .read(navigationRailProvider.notifier)
                            .setTab(NavigationRailType.dashboard),
                      ))
                ],
              ),
            ),
            const VerticalSpacingWidget(Sizes.p16),
            const ProductsSearchRow(),
            const VerticalSpacingWidget(Sizes.p16),
            Expanded(
              child: CashierProductsTable(
                selectedCategory: widget.selectedCategory,
                onCategorySelect: widget.onCategorySelect,
                selectedProduct: widget.selectedProduct,
                onProductSelect: widget.onProductSelect,
              ),
            ),
            AnimatedRotation(
              duration: Duration.zero,
              turns: !showCountSelector ? 0 : 1 / 2,
              child: TraingleWidget(
                onTap: showCountSelector
                    ? () =>
                        ref.read(selectedOrderItem.notifier).unselectOrderItem()
                    : null,
                paintingStyle: PaintingStyle.fill,
                height: traingleSide,
                width: traingleSide * 2,
              ),
            ),
            if (showCountSelector) ...[
              const VerticalSpacingWidget(Sizes.p8),
              SizedBox(
                width: double.maxFinite,
                child: CountSelector(
                  key: _counterSelectorKey,
                ),
              ),
            ]
          ],
        ),
      );
    });
  }
}

// TODO : check for refactor
class ProductsSearchRow extends HookWidget {
  const ProductsSearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCtrl = useTextEditingController();
    return Row(children: [
      Expanded(
        child: LayoutBuilder(builder: (context, c) {
          return PopupMenuButton(
            clipBehavior: Clip.hardEdge,
            constraints: BoxConstraints(maxWidth: c.maxWidth),
            child: AppBorderedTextField(
              controller: null,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: context.appColors.primary,
              ),
              hintText: 'Recherche par categorie',
              enabled: false,
            ),
            itemBuilder: (context) => DummyData.categoriesList.toPopupItems(
                childBuilder: (item) => SizedBox(
                      width: double.maxFinite,
                      child: AppText(text: item.name),
                    )),
          );
        }),
      ),
      const HorizontalSpacingWidget(Sizes.p8),
      Expanded(
        child: AppBorderedTextField(
          contentPadding: const EdgeInsets.all(Sizes.p8),
          prefixIcon: const Icon(Icons.search),
          controller: searchCtrl,
          hintText: 'Rechercher d\'un Article: Nom, Code...',
        ),
      ),
      const HorizontalSpacingWidget(Sizes.p8),
      IconButton.filled(
          style:
              IconButton.styleFrom(backgroundColor: context.appColors.primary),
          onPressed: () {},
          icon: const Icon(Icons.search)),
      const HorizontalSpacingWidget(Sizes.p8),
    ]);
  }
}
