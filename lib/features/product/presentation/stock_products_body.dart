import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/widgets/shared/app_main_tabled_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/presentation/widgets/product_actions_row.dart';

class ProductsTabBody extends HookConsumerWidget {
  const ProductsTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = DummyData.productsList;
    final selectedItems = useState<List<String>>([]);
    final showActions = useState(false);
    final searchCtrl = useTextEditingController();
    useEffect(() {
      showActions.value = selectedItems.value.length == 1;
      return null;
    }, [selectedItems.value]);
    return AppMainTabledBody<Product>(
        title: 'Stocke & Produits',
        primaryCards: const [
          AppPrimaryCard(
            icon: Icons.attach_money,
            title: '1,560,236.03 MAD',
            subTitle: 'Totals de Stocks',
          ),
          AppPrimaryCard(
            icon: Icons.refresh,
            title: '75 Produits',
            subTitle: 'Stock d\'alert',
          ),
          AppPrimaryCard(
            icon: Icons.attach_money,
            title: '100 Produits',
            subTitle: 'Produits Finis',
          ),
          AppPrimaryCard(
            icon: Icons.attach_money,
            title: '2500 Produits',
            subTitle: 'Total de Produits',
          ),
        ],
        table: AppTabledCard<Product>(
          actions: ProductsActionRow(
            searchCtrl: searchCtrl,
            showActions: showActions,
            onSearch: () {},
          ),
          showActions: showActions,
          items: productList,
          selectedItems: selectedItems,
          headers: _headers,
          cellValues: (index) => [
            productList[index].id,
            productList[index].name,
            productList[index].sellPrice.toString(),
            productList[index].buyPrice.toString(),
            productList[index].stockCount.toString(),
            productList[index].alertCount.toString(),
          ],
          itemIdField: (item) => item.id,
          rowSelectionId: (index) => productList[index].id,
        ));
  }
}

const List<String> _headers = [
  '',
  'ID',
  'Nome de Produit',
  'Prix',
  'Prix d\'achat',
  'Stock',
  'Stock d\'alert'
];
