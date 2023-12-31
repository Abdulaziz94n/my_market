import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/mixins/text_formatters_mixin.dart';
import 'package:my_market/core/mixins/validators_mixin.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/utils/optional_model.dart';
import 'package:my_market/core/widgets/shared/app_date_textfield.dart';
import 'package:my_market/core/widgets/shared/app_dialog_form_field.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/async_value_widget.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/data/plus_category_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';
import 'package:my_market/features/product/data/product_provider_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';
import 'package:my_market/features/product/presentation/widgets/add_product_dialog_actions.dart';

class AddProductDialog extends StatefulHookConsumerWidget {
  const AddProductDialog({
    super.key,
  });

  @override
  ConsumerState<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends ConsumerState<AddProductDialog>
    with Validators, AppTextFormatter {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final product = useState<ProductModel>(ProductModel.initial());
    final selectedCategory = useState<CategoryModel?>(null);
    final selectedPlusCategory = useState<PlusCategoryModel?>(null);
    final selectedProductProvider = useState<ProductProviderModel?>(null);
    const horizontalSpace = HorizontalSpacingWidget(Sizes.p16);
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
                text: 'Ajouter un Produit',
                style: context.appTextTheme.titleMedium,
              )),
              const VerticalSpacingWidget(Sizes.p32),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Code Bare',
                      hint: '1558475654',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) => product.value =
                          product.value.copyWith(barcode: value),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Nom de Produit',
                      hint: 'Danetter Chocolat 55ml',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) =>
                          product.value = product.value.copyWith(name: value),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Prix d\'achat',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [amountInputFormatter()],
                      hint: 'Le Prix est',
                      // TODO:
                      onSave: (value) => product.value = product.value.copyWith(
                        providersDetails: [
                          product.value.providersDetails.first
                              .copyWith(buyPrice: value!.tryParseDouble!)
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Prix de vente',
                      hint: 'Le Prix est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [amountInputFormatter()],
                      onSave: (value) => product.value = product.value
                          .copyWith(sellPrice: value!.tryParseDouble),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Stock',
                      hint: 'Stock est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) {
                        product.value = product.value
                            .copyWith(stockCount: value!.tryParseInt);
                      },
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Stock d\'alert',
                      hint: 'Stock est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) => product.value = product.value
                          .copyWith(alertCount: value!.tryParseInt),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AsyncValueWidget(
                      value: ref.watch(categoryStreamProvider),
                      data: (categories) => AppDialogFormField<CategoryModel>(
                        title: 'Famille',
                        hint: 'Ajouter n Code a barre',
                        asDropDown: (
                          items: categories,
                          childBuilder: (value) => AppText(text: value.name),
                          dropDownvalidator: validateGenericIsEmpty,
                          isDropDown: true,
                          onChanged: (val) {
                            selectedCategory.value = val;
                            product.value = product.value
                                .copyWith(categoryId: val!.localId);
                          },
                          value: selectedCategory.value,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AsyncValueWidget(
                      value: ref.watch(productsStreamProvider),
                      data: (providers) =>
                          AppDialogFormField<ProductProviderModel>(
                        title: 'Fournisseur',
                        hint: 'Ajouter n Code a barre',
                        asDropDown: (
                          items: providers,
                          childBuilder: (value) => AppText(text: value.name),
                          dropDownvalidator: validateGenericIsEmpty,
                          isDropDown: true,
                          onChanged: (val) {
                            selectedProductProvider.value = val!;
                            product.value = product.value.copyWith(
                              providersDetails: [
                                product.value.providersDetails.first
                                    .copyWith(provider: val)
                              ],
                            );
                          },
                          value: selectedProductProvider.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AsyncValueWidget(
                      value: ref.watch(plusCategoryStreamProvider),
                      data: (plusCategories) =>
                          AppDialogFormField<PlusCategoryModel>(
                        title: 'Plus Utilities',
                        hint: 'Ajouter Utility',
                        asDropDown: (
                          items: plusCategories,
                          childBuilder: (value) => AppText(text: value.name),
                          dropDownvalidator: null,
                          isDropDown: true,
                          onChanged: (val) {
                            selectedPlusCategory.value = val!;
                            product.value = product.value.copyWith(
                              utilityId: selectedPlusCategory.value!.localId,
                            );
                          },
                          value: selectedPlusCategory.value,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDateTextField2(
                      title: 'Expiration Date',
                      hint: 'select Expiration Date',
                      selectedDate: product.value.expirationDate,
                      lastDate:
                          DateTime.now().add(const Duration(days: 360 * 7)),
                      onDateSelect: (val) => product.value = product.value
                          .copyWith(expirationDate: Optional.value(val)),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p32),
              AddProductDialogActions(
                horizontalSpace: horizontalSpace,
                colors: colors,
                product: product.value,
                onAdd: () {
                  if (formKey.currentState!.validate()) {
                    final now = DateTime.now();
                    formKey.currentState!.save();
                    product.value = product.value.copyWith(createdAt: now);
                    AppDialogs.syncDialog(
                      fromDialog: true,
                      dialogBgColor: colors.background,
                      context: context,
                      action: () => ref
                          .read(productsController.notifier)
                          .addProduct(product.value),
                      successMessage: 'Product Added Successfully',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
