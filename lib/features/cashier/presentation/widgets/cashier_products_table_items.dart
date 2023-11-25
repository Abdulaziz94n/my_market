import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/num_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/presentation/new_order_controller.dart';
import 'package:my_market/features/product/domain/product_model.dart';

class CashierProductsTableItems extends ConsumerWidget {
  const CashierProductsTableItems({
    super.key,
    required this.products,
  });
  final List<Product> products;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      // TODO: Control later
      shrinkWrap: true,
      itemCount: products.length,
      separatorBuilder: (_, __) => const VerticalSpacingWidget(Sizes.p16),
      itemBuilder: (context, index) => _ProductRow(
        key: ValueKey(products[index].id),
        product: products[index],
      ),
    );
  }
}

class _ProductRow extends ConsumerWidget {
  const _ProductRow({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: AppRoundedBox(child: AppText(text: product.barcode))),
        const HorizontalSpacingWidget(Sizes.p8),
        Expanded(
          flex: 3,
          child: AppRoundedBox(
              onTap: () {
                ref.read(newOrderController.notifier).addOrderItem(
                    OrderItemModel(product: product, quantity: 1));
              },
              child: AppText(text: product.name.capEach)),
        ),
        const HorizontalSpacingWidget(Sizes.p8),
        Expanded(
          child: AppRoundedBox(
              child: AppText(text: product.sellPrice.maskedString)),
        ),
        const HorizontalSpacingWidget(Sizes.p8),
        Expanded(
          child: AppRoundedBox(
              child: AppText(text: product.buyPrice.maskedString)),
        ),
        const HorizontalSpacingWidget(Sizes.p8),
        Expanded(
          child: AppRoundedBox(
            child: AppText(text: product.shortCode),
          ),
        ),
        const HorizontalSpacingWidget(Sizes.p8),
      ],
    );
  }
}
