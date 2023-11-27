import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_divider.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_user_indicator.dart';
import 'package:my_market/core/widgets/shared/async_value_widget.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/widgets/order_item_list.dart';
import 'package:my_market/features/cashier/presentation/widgets/user_status_indicator.dart';
import 'package:my_market/features/order/data/order_ticket_no_repo.dart';
import 'package:my_market/features/order/domain/order_items_list_extension.dart';
import 'package:my_market/features/order/presentation/new_order_controller.dart';
import 'package:my_market/features/order/presentation/submit_order_controller.dart';

class OrderContent extends ConsumerWidget {
  const OrderContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderItems = ref.watch(newOrderController).orderItems;
    return Padding(
      padding: const EdgeInsets.all(Sizes.p24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppUserIndicator(),
              UserStatusIndicator(),
            ],
          ),
          const VerticalSpacingWidget(Sizes.p4),
          Row(
            children: [
              const AppText(text: 'Ticket Number '),
              AsyncValueWidget(
                value: ref.watch(fetchTicketNo),
                data: (ticketNo) => AppText(text: '#$ticketNo'),
                loadingIndicator: const AppText(text: 'xxxxxx'),
              ),
            ],
          ),
          const VerticalSpacingWidget(Sizes.p20),
          const AppDivider(),
          const VerticalSpacingWidget(Sizes.p20),
          const Expanded(child: OrderItemsList()),
          const VerticalSpacingWidget(Sizes.p20),
          const AppDivider(),
          const VerticalSpacingWidget(Sizes.p8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(text: 'Total HT : ???'),
              AppText(text: 'Total Items : ${orderItems.length}'),
            ],
          ),
          const VerticalSpacingWidget(Sizes.p8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(text: 'Total'),
              AppText(text: '${orderItems.calcTotal} DH'),
            ],
          ),
          const VerticalSpacingWidget(Sizes.p12),
          const AppDivider(),
          const VerticalSpacingWidget(Sizes.p32),
          Row(
            children: [
              SizedBox(
                child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: context.appColors.error,
                    ),
                    onPressed: () =>
                        ref.read(newOrderController.notifier).clearItems(),
                    icon: Icon(
                      Icons.delete,
                      color: context.appColors.onPrimary,
                    )),
              ),
              const HorizontalSpacingWidget(Sizes.p8),
              Expanded(
                child: AppPrimaryButton(
                  height: Sizes.defaultButtonHeight,
                  onPressed: () {
                    final order = ref.read(newOrderController);
                    ref.read(submitOrderController.notifier).submitOrder(
                        order, ref.read(fetchTicketNo).requireValue);
                  },
                  text: 'REGLEMENT',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
