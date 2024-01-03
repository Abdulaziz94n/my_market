import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/reusables/app_stream_builder.dart';
import 'package:my_market/core/widgets/shared/app_main_tabled_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/presentation/widgets/product_actions_row.dart';

class ProductsTabBody extends HookConsumerWidget {
  const ProductsTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppStreamBuilder<List<ProductModel>>(
      stream: ref.watch(productsRepo).getAll(),
      streamSuccessWidget: (productList) {
        return AppMainTabledBody<ProductModel>(
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
            table: (_) {
              final selectedItems = useState<List<String>>([]);
              final filterableProducts =
                  useState<List<ProductModel>>(productList);
              final showActions = useState(false);
              final searchCtrl = useTextEditingController();
              useEffect(() {
                selectedItems.value = [];
                return null;
              }, productList);
              return AppTabledCard<ProductModel>(
                actions: ProductsActionRow(
                  searchCtrl: searchCtrl,
                  showActions: showActions,
                  onShow: (val) => showActions.value = val,
                  isItemSelected: selectedItems.value.isSingleElement,
                  // TODO: Refactor
                  selectedItem: selectedItems.value.isSingleElement
                      ? productList.firstWhere((element) =>
                          element.localId.toString() ==
                          selectedItems.value.first)
                      : null,
                  onSearch: (query) {
                    filterableProducts.value = productList
                        .where((element) => element.name.contains(query))
                        .toList();
                  },
                ),
                showActions: showActions,
                items: filterableProducts.value,
                selectedItems: selectedItems,
                headers: _headers,
                cellValues: (index) => [
                  filterableProducts.value[index].localId.toString(),
                  filterableProducts.value[index].name,
                  filterableProducts.value[index].sellPrice.toString(),
                  filterableProducts.value[index].buyPrice.toString(),
                  filterableProducts.value[index].stockCount.toString(),
                  filterableProducts.value[index].alertCount.toString(),
                ],
                itemIdField: (item) => item.localId.toString(),
                rowSelectionId: (index) =>
                    filterableProducts.value[index].localId.toString(),
              );
            });
      },
    );
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
