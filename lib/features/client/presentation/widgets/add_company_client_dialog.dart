import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/mixins/text_formatters_mixin.dart';
import 'package:my_market/core/mixins/validators_mixin.dart';
import 'package:my_market/core/widgets/shared/app_dialog_form_field.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/client/domain/company_client_model.dart';

class AddCompanyClienttDialog extends StatefulHookConsumerWidget {
  const AddCompanyClienttDialog({
    super.key,
  });

  @override
  ConsumerState<AddCompanyClienttDialog> createState() =>
      _AddCompanyClienttDialogState();
}

class _AddCompanyClienttDialogState
    extends ConsumerState<AddCompanyClienttDialog>
    with Validators, AppTextFormatter {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final client = useState<CompanyClientModel>(CompanyClientModel.initial());
    const horizontalSpace = HorizontalSpacingWidget(Sizes.p16);

    // ref.listen(productsController, (previous, next) {
    //   AsyncValueUtils.handleAsyncVal(
    //     context: context,
    //     previous: previous,
    //     next: next,
    //     successMessage: 'Client Added Successfully',
    //     onSuccessAction: () {
    //       formKey.currentState!.reset();
    //       product.value = ProductModel.initial();
    //       selectedCategory.value = null;
    //       selectedProductProvider.value = null;
    //     },
    //   );
    // });
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
                text: 'Ajouter un Client',
                style: context.appTextTheme.titleMedium,
              )),
              const VerticalSpacingWidget(Sizes.p32),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Nom & Prenom',
                      hint: 'Ajouter un nom',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) =>
                          client.value = client.value.copyWith(fullName: value),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Nom de la societe',
                      hint: 'Ajouter un name de Ste',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) => client.value =
                          client.value.copyWith(companyName: value),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      readOnly: true,
                      title: 'ID',
                      textFieldValidator: validateIsEmpty,
                      hint: 'L\'id est',
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Code',
                      hint: 'Le code est',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) =>
                          client.value = client.value.copyWith(code: value!),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'ICE',
                      hint: 'L\'ice est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) {
                        client.value = client.value.copyWith(ice: value!);
                      },
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'IF',
                      hint: 'L\'if est',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) =>
                          client.value = client.value.copyWith(iF: value),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField<CategoryModel>(
                      title: 'Numero de Telephone',
                      hint: 'Ajoutern un numero de telephone',
                      textFieldValidator: validateNumbersOnly,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (val) => client.value =
                          client.value.copyWith(phoneNumber: val),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField<String>(
                      title: 'E-mail',
                      hint: 'Ajouter un adresse e-mail',
                      textFieldValidator: validateEmail,
                      onSave: (val) =>
                          client.value = client.value.copyWith(email: val),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p32),
              AppText.clickable(
                  text: 'Ajouter plus de details', onClick: () {}),
              const VerticalSpacingWidget(Sizes.p32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: AppPrimaryButton.icon(
                      icon: Icons.add,
                      color: colors.success,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(client);
                          // ref
                          //     .read(clientContorller.notifier)
                          //     .addCompanyClient(client);
                        }
                      },
                      text: 'Ajouter',
                    ),
                  ),
                  horizontalSpace,
                  SizedBox(
                    width: 200,
                    child: AppPrimaryButton.icon(
                      icon: Icons.close,
                      color: colors.error,
                      onPressed: () => context.pop(),
                      text: 'Annuler',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
