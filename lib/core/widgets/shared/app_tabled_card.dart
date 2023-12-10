import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_2d_scrollable_table.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AppTabledCard<T> extends StatelessWidget {
  const AppTabledCard({
    super.key,
    required this.showActions,
    required this.selectedItems,
    required this.cellValues,
    required this.items,
    required this.headers,
    required this.rowSelectionId,
    required this.itemIdField,
    required this.actions,
  });

  final ValueNotifier<bool> showActions;
  final String Function(int) rowSelectionId;
  final List<String> Function(int) cellValues;
  final List<T> items;
  final List<String> headers;
  final String Function(T) itemIdField;
  final ValueNotifier<List<String>> selectedItems;
  final Widget actions;

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
              actions,
              const VerticalSpacingWidget(Sizes.p16),
              Expanded(
                child: AppTwoDimensionScrollableTable(
                    items: items,
                    headerBackground: colors.grey,
                    headers: headers,
                    cellValues: cellValues,
                    rowSelectionId: rowSelectionId,
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
                      final ids = items.map(itemIdField).toList();
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
