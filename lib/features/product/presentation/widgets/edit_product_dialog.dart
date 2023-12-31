import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/mixins/text_formatters_mixin.dart';
import 'package:my_market/core/mixins/validators_mixin.dart';
import 'package:my_market/core/utils/async_value_utils.dart';
import 'package:my_market/core/widgets/shared/app_dialog_form_field.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';
import 'package:my_market/features/product/presentation/widgets/edit_product_dialog_actions.dart';

class EditProductDialog extends StatefulHookConsumerWidget {
  const EditProductDialog({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  ConsumerState<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends ConsumerState<EditProductDialog>
    with Validators, AppTextFormatter {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final newProduct = useState<ProductModel>(widget.product);
    final selectedCategory = useState<CategoryModel?>(null);
    final selectedProductProvider = useState<String?>(null);
    const horizontalSpace = HorizontalSpacingWidget(Sizes.p16);

    ref.listen(productsController, (previous, next) {
      AsyncValueUtils.handleAsyncVal(
        context: context,
        previous: previous,
        next: next,
        successMessage: 'Product Added Successfully',
        onSuccessAction: () => context.pop(),
      );
    });
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: 900,
        child: Padding(
          padding: Sizes.defaultDialogPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: AppText(
                text: 'Modifier le Produit',
                style: context.appTextTheme.titleMedium,
              )),
              const VerticalSpacingWidget(Sizes.p32),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.barcode,
                      title: 'Code Bare',
                      hint: '1558475654',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) => newProduct.value =
                          newProduct.value.copyWith(barcode: value),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.name,
                      title: 'Nom de Produit',
                      hint: 'Danetter Chocolat 55ml',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) => newProduct.value =
                          newProduct.value.copyWith(name: value),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.buyPrice.toString(),
                      title: 'Prix d\'achat',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [amountInputFormatter()],
                      hint: 'Le Prix est',
                      onSave: (value) =>
                          newProduct.value = newProduct.value.copyWith(
                        providersDetails: newProduct.value.providersDetails
                            .copyWith(buyPrice: value!.tryParseDouble),
                      ),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.sellPrice.toString(),
                      title: 'Prix de vente',
                      hint: 'Le Prix est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [amountInputFormatter()],
                      onSave: (value) => newProduct.value = newProduct.value
                          .copyWith(sellPrice: value!.tryParseDouble),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.stockCount.toString(),
                      title: 'Stock',
                      hint: 'Stock est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) {
                        newProduct.value = newProduct.value
                            .copyWith(stockCount: value!.tryParseInt);
                      },
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: widget.product.alertCount.toString(),
                      title: 'Stock d\'alert',
                      hint: 'Stock est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) => newProduct.value = newProduct.value
                          .copyWith(alertCount: value!.tryParseInt),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField<CategoryModel>(
                      title: 'Famille',
                      hint: 'Ajouter n Code a barre',
                      asDropDown: (
                        items: DummyData.categoriesList,
                        childBuilder: (value) => AppText(text: value.name),
                        dropDownvalidator: validateGenericIsEmpty,
                        isDropDown: true,
                        onChanged: (val) {
                          selectedCategory.value = val;
                          newProduct.value =
                              newProduct.value.copyWith(categoryId: val!.id);
                        },
                        value: DummyData.categoriesList.firstWhere((element) =>
                            element.id == widget.product.categoryId),
                      ),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField<String>(
                      title: 'Fournisseur',
                      hint: 'Ajouter n Code a barre',
                      asDropDown: (
                        items: DummyData.productProviders,
                        childBuilder: (value) => AppText(text: value),
                        dropDownvalidator: validateIsEmpty,
                        isDropDown: true,
                        onChanged: (val) {
                          selectedProductProvider.value = val!;
                          newProduct.value = newProduct.value.copyWith(
                            providersDetails:
                                newProduct.value.providersDetails.copyWith(
                              providerName: selectedProductProvider.value,
                            ),
                          );
                        },
                        value: DummyData.productProviders.firstWhere(
                            (element) =>
                                element ==
                                widget.product.providersDetails.providerName),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p32),
              EditProductDialogActions(
                horizontalSpace: horizontalSpace,
                colors: colors,
                formKey: formKey,
                product: newProduct.value,
                isValidUpdate: widget.product != newProduct.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
