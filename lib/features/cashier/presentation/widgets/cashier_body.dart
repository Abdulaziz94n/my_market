import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/utils/async_value_utils.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_card.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products.dart';
import 'package:my_market/features/order/data/order_ticket_no_repo.dart';
import 'package:my_market/features/order/presentation/new_order_controller.dart';
import 'package:my_market/features/order/presentation/submit_order_controller.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_model_extension.dart';

class CashierBody extends HookConsumerWidget {
  const CashierBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(submitOrderController, (previous, next) {
      AsyncValueUtils.handleAsyncVal(
        context: context,
        previous: previous,
        next: next,
        successMessage: 'Order Submitted',
        onSuccessAction: () {
          ref.invalidate(fetchTicketNo);
          ref.read(newOrderController.notifier).clearItems();
        },
      );
    });
    final newOrderNotifier = ref.read(newOrderController.notifier);
    final selectedProduct = useState<Product?>(null);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: CashierCard(
              addItem: () => newOrderNotifier.addOrderItem(
                selectedProduct.value!.toOrderItem,
              ),
            )),
        Expanded(
            flex: 3,
            child: CashierProducts(
              onSelect: (item) => selectedProduct.value = item,
              selectedProduct: selectedProduct.value,
            )),
      ],
    );
  }
}
