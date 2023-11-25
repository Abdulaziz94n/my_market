import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/new_order_controller.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';

const _size = 22.0;

class OrderItemsList extends ConsumerWidget {
  const OrderItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsList = ref.watch(newOrderController).orderItems;
    final orderController = ref.read(newOrderController.notifier);
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return OrderItem(
          orderItem: itemsList[index],
          onIncreament: () => orderController.increaseQuantity(index),
          onDecreament: () => orderController.decreaseQuantity(index),
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
    super.key,
  });
  final OrderItemModel orderItem;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = orderItem.product;
    final quantity = orderItem.quantity;
    return ListTile(
      onTap: () {},
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
