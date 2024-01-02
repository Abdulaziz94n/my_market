import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/num_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class CashierProductsTableItems extends ConsumerWidget {
  const CashierProductsTableItems({
    super.key,
    required this.products,
    required this.onSelect,
    required this.selectedProduct,
  });
  final List<ProductModel> products;
  final ProductModel? selectedProduct;
  final ValueChanged<ProductModel> onSelect;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      // TODO: Control later
      shrinkWrap: true,
      itemCount: products.length,
      separatorBuilder: (_, __) => const VerticalSpacingWidget(Sizes.p16),
      itemBuilder: (context, index) => _ProductRow(
        key: ValueKey(products[index].localId),
        product: products[index],
        onSelect: onSelect,
        selectedProduct: selectedProduct,
      ),
    );
  }
}

class _ProductRow extends ConsumerWidget {
  const _ProductRow({
    super.key,
    required this.product,
    required this.onSelect,
    required this.selectedProduct,
  });
  final ProductModel product;
  final ValueChanged<ProductModel> onSelect;
  final ProductModel? selectedProduct;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final isSelected = product == selectedProduct;
    final color = isSelected ? colors.primary : colors.background;
    final textColor = isSelected ? colors.onPrimary : colors.primary;
    return DefaultTextStyle(
      style: TextStyle(color: textColor),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppRoundedBox(
                color: color,
                onTap: isSelected ? null : () => onSelect(product),
                child: AppText(text: product.barcode)),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            flex: 3,
            child: AppRoundedBox(
                color: color,
                onTap: isSelected ? null : () => onSelect(product),
                child: AppText(text: product.name.capEach)),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            child: AppRoundedBox(
                color: color,
                onTap: isSelected ? null : () => onSelect(product),
                child: AppText(text: product.sellPrice.maskedString)),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            child: AppRoundedBox(
                color: color,
                onTap: isSelected ? null : () => onSelect(product),
                child: AppText(text: product.buyPrice.maskedString)),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            child: AppRoundedBox(
              color: color,
              onTap: isSelected ? null : () => onSelect(product),
              child: AppText(text: product.shortCode),
            ),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
        ],
      ),
    );
  }
}
