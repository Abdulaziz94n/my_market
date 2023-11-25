import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/shared/app_secondary_button.dart';
import 'package:my_market/features/order/presentation/new_order_controller.dart';
import 'package:my_market/features/order/presentation/order_item_controller.dart';

class CountSelector extends ConsumerStatefulWidget {
  const CountSelector({
    super.key,
  });
  @override
  ConsumerState<CountSelector> createState() => _CountSelectorState();
}

class _CountSelectorState extends ConsumerState<CountSelector> {
  StringBuffer buffer = StringBuffer();
  var count = '';

  @override
  Widget build(BuildContext context) {
    final selectedItem = ref.watch(selectedOrderItem);

    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      crossAxisCount: 5,
      childAspectRatio: 2,
      mainAxisSpacing: Sizes.p16,
      crossAxisSpacing: Sizes.p16,
      children: List.generate(
          10,
          (index) => AppSecondaryButton(
              text: '$index',
              textStyle: TextStyle(
                fontSize: 24,
                color: context.appColors.onBackground,
              ),
              onPressed: () {
                count = _getCount(buffer, index.toString());
                ref
                    .read(newOrderController.notifier)
                    .setQuantity(selectedItem!, count.tryParseInt!);
              })),
    );
  }

  String _getCount(StringBuffer buffer, String input) {
    buffer.write(input);
    if (buffer.toString() == '0') {
      buffer.clear();
      buffer.write('1');
      return buffer.toString();
    } else {
      return buffer.toString();
    }
  }
}
