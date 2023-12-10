import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/presentation/widgets/products_tabled_card.dart';

class ProductsTabBody extends HookConsumerWidget {
  const ProductsTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final productList = DummyData.productsList;
    final selectedItems = useState<List<String>>([]);
    final showActions = useState(false);
    const horizontalSpacing = HorizontalSpacingWidget(Sizes.p12);
    final searchCtrl = useTextEditingController();
    useEffect(() {
      showActions.value = selectedItems.value.length == 1;
      return null;
    }, [selectedItems.value]);
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
          child: ProductsTabledCard(
            searchCtrl: searchCtrl,
            showActions: showActions,
            productList: productList,
            selectedItems: selectedItems,
          ),
        )
      ],
    );
  }
}
