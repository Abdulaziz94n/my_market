import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/presentation/new_order_controller.dart';
import 'package:my_market/features/order/presentation/order_item_controller.dart';

const _size = 22.0;

class OrderItemsList extends ConsumerWidget {
  const OrderItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsList = ref.watch(newOrderController).orderItems;
    final orderController = ref.read(newOrderController.notifier);
    final selectedOrderController = ref.read(selectedOrderItem.notifier);
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        final orderItem = itemsList[index];
        return OrderItem(
          onTap: () {
            final selectedItem = ref.read(selectedOrderItem);
            if (selectedItem != null) {
              ref.invalidate(selectedOrderItem);
            }
            final isSelected = selectedItem == orderItem;
            !isSelected
                ? selectedOrderController.selectOrderItem(orderItem)
                : selectedOrderController.unselectOrderItem();
          },
          orderItem: orderItem,
          onIncreament: () {
            ref.read(selectedOrderItem.notifier).unselectOrderItem();
            orderController.increaseQuantity(index);
          },
          onDecreament: () {
            ref.read(selectedOrderItem.notifier).unselectOrderItem();
            orderController.decreaseQuantity(index);
          },
        );
      },
    );
  }
}

class OrderItem extends HookConsumerWidget {
  const OrderItem({
    required this.orderItem,
    required this.onIncreament,
    required this.onDecreament,
    required this.onTap,
    super.key,
  });
  final OrderItemModel orderItem;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = orderItem.product;
    final quantity = orderItem.quantity;
    final colors = context.appColors;
    final selectedItem = ref.watch(selectedOrderItem);
    final isSelected = orderItem == selectedItem;
    return ListTile(
      selected: isSelected,
      selectedColor: colors.primary,
      selectedTileColor: colors.inActive,
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: Sizes.p12),
      title: AppText(text: product.name.capEach),
      subtitle: AppText(text: '${product.sellPrice} MAD'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBorderedBox.withIcon(
            boxShape: BoxShape.circle,
            // onTap: quantity <= 1 ? null : onDecreament,
            onTap: onDecreament,
            width: _size,
            height: _size,
            icon: Icons.remove,
            iconSize: _size / 1.5,
          ),
          SizedBox(
            width: 25,
            child: AppText(
              text: '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          AppBorderedBox.withIcon(
            boxShape: BoxShape.circle,
            onTap: onIncreament,
            width: _size,
            height: _size,
            icon: Icons.add,
            iconSize: _size / 1.5,
          ),
          const HorizontalSpacingWidget(Sizes.p12),
        ],
      ),
    );
  }
}
