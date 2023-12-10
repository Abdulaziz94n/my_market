import 'package:flutter/material.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_2d_scrollable_table.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/presentation/widgets/product_actions_row.dart';

// TODO: Modify To Generic Impl

class ProductsTabledCard extends StatelessWidget {
  const ProductsTabledCard({
    super.key,
    required this.searchCtrl,
    required this.showActions,
    required this.productList,
    required this.selectedItems,
  });

  final TextEditingController searchCtrl;
  final ValueNotifier<bool> showActions;

  final List<Product> productList;
  final ValueNotifier<List<String>> selectedItems;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Column(
            children: [
              ProductsActionRow(
                searchCtrl: searchCtrl,
                showActions: showActions,
                onChanged: (val) => showActions.value = !val,
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Expanded(
                child: AppTwoDimensionScrollableTable(
                    items: DummyData.productsList,
                    headerBackground: colors.grey,
                    headers: const [
                      '',
                      'ID',
                      'Nome de Produit',
                      'Prix',
                      'Prix d\'achat',
                      'Stock',
                      'Stock d\'alert'
                    ],
                    cellValues: (index) => [
                          productList[index].id,
                          productList[index].name,
                          productList[index].sellPrice.toString(),
                          productList[index].buyPrice.toString(),
                          productList[index].stockCount.toString(),
                          productList[index].alertCount.toString(),
                        ],
                    rowSelectionId: (index) {
                      return productList[index].id;
                    },
                    selectedRows: selectedItems.value,
                    onSelect: (val) {
                      if (selectedItems.value.isNotEmpty) {
                        selectedItems.value = [];
                        return;
                      }
                      selectedItems.value = [...selectedItems.value, val];
                    },
                    onSelectAll: () {
                      if (selectedItems.value.contains('all')) {
                        selectedItems.value = [];
                        return;
                      }
                      final ids = productList.map((e) => e.id).toList();
                      selectedItems.value = [...ids, 'all'];
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
