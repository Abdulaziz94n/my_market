import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/shared/app_text_field.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products_table_headers.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products_table_items.dart';
import 'package:my_market/features/categories/domain/categories_model.dart';
import 'package:my_market/features/categories/presentation/widgets/categories_list.dart';

class CashierProductsTable extends HookWidget {
  const CashierProductsTable({
    super.key,
    required this.selectedCategory,
  });
  final ValueNotifier<Category?> selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategorySelectionList(
          onSelect: (val) => selectedCategory.value = val,
          selectedCategory: selectedCategory.value,
        ),
        const VerticalSpacingWidget(Sizes.p8),
        const CashierProductsTableHeaders(),
        const VerticalSpacingWidget(Sizes.p16),
        Flexible(
          child: CashierProductsTableItems(products: DummyData.productsList),
        ),
        const VerticalSpacingWidget(Sizes.p32),
        const _BarcodeSearchFields()
      ],
    );
  }
}

class _BarcodeSearchFields extends HookWidget {
  const _BarcodeSearchFields();

  @override
  Widget build(BuildContext context) {
    final barcodeCtrl = useTextEditingController();
    final barcodeCtrl2 = useTextEditingController();

    return Row(
      children: [
        Expanded(
          child: AppTextField.withController(
            controller: barcodeCtrl,
            label: 'Code a barre...',
            prefixIcon: const Icon(Icons.qr_code_2_outlined),
          ),
        ),
        const HorizontalSpacingWidget(Sizes.p32),
        Expanded(
          child: AppTextField.withController(
            controller: barcodeCtrl2,
            label: 'Code a barre...',
            prefixIcon: const Icon(Icons.abc),
          ),
        ),
      ],
    );
  }
}
