import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

const _size = 22.0;

class OrderItemsList extends ConsumerWidget {
  const OrderItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return OrderItem(
          productName: 'productName',
          price: 100,
          onIncreament: (value) {},
          onDecreament: (value) {},
        );
      },
    );
  }
}

class OrderItem extends HookConsumerWidget {
  const OrderItem({
    required this.productName,
    required this.price,
    required this.onIncreament,
    required this.onDecreament,
    super.key,
  });
  final String productName;
  final int price;
  final ValueChanged<int> onIncreament;
  final ValueChanged<int> onDecreament;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = useState(1);
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.only(left: Sizes.p12),
      title: AppText(text: productName.capEach),
      subtitle: AppText(text: '$price MAD'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBorderedBox.withIcon(
            boxShape: BoxShape.circle,
            onTap: quantity.value <= 1
                ? null
                : () => onDecreament(quantity.value--),
            width: _size,
            height: _size,
            icon: Icons.remove,
            iconSize: _size / 1.5,
          ),
          SizedBox(
            width: 25,
            child: AppText(
              text: '${quantity.value}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          AppBorderedBox.withIcon(
            boxShape: BoxShape.circle,
            onTap: () => onIncreament(quantity.value++),
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
