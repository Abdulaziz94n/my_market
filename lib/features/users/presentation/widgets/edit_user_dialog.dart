import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/mixins/text_formatters_mixin.dart';
import 'package:my_market/core/mixins/validators_mixin.dart';
import 'package:my_market/core/widgets/shared/app_dialog_form_field.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/users/domain/gender_enum.dart';
import 'package:my_market/features/users/domain/user_model.dart';
import 'package:my_market/features/users/domain/user_role_enum.dart';

class EditUsereDialog extends StatefulHookConsumerWidget {
  const EditUsereDialog({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  ConsumerState<EditUsereDialog> createState() => _EditUsereDialogState();
}

class _EditUsereDialogState extends ConsumerState<EditUsereDialog>
    with Validators, AppTextFormatter {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final user = useState(widget.user);
    final gender = useState<Gender?>(widget.user.gender);
    final role = useState<UserRole?>(widget.user.role);

    const horizontalSpace = HorizontalSpacingWidget(Sizes.p16);

    // ref.listen(productsController, (previous, next) {
    //   AsyncValueUtils.handleAsyncVal(
    //     context: context,
    //     previous: previous,
    //     next: next,
    //     successMessage: 'user Added Successfully',
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
                text: 'Ajouter un employe',
                style: context.appTextTheme.titleMedium,
              )),
              const VerticalSpacingWidget(Sizes.p32),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: user.value.name,
                      title: 'Nom & Prenom',
                      hint: 'Ajouter un nom',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) =>
                          user.value = user.value.copyWith(name: value),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      initialValue: user.value.phoneNumber.toString(),
                      title: 'Numero de Telephone',
                      hint: 'Ajoutern un numero de telephone',
                      textFieldValidator: validateNumbersOnly,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (val) => user.value =
                          user.value.copyWith(phoneNumber: val!.tryParseInt),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppDialogFormField(
                      initialValue: user.value.nationalId,
                      readOnly: true,
                      title: 'N CIN',
                      textFieldValidator: validateIsEmpty,
                      hint: 'Numero de la carte nationale est...',
                      onSave: (val) =>
                          user.value = user.value.copyWith(nationalId: val),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Genre',
                      hint: 'Chosir le genre',
                      textFieldValidator: validateIsEmpty,
                      onSave: (value) => user.value =
                          user.value.copyWith(genderId: gender.value!.id),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Role',
                      hint: 'Chosir le role',
                      textFieldValidator: validateIsEmpty,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (value) {
                        user.value =
                            user.value.copyWith(roleId: role.value!.id);
                      },
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              Row(
                children: [
                  Expanded(
                    child: AppDialogFormField(
                      title: 'Date d\'inscription',
                      hint: 'Ajouter une date d\'inscription',
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onSave: (val) => user.value =
                          user.value.copyWith(registrationDate: val),
                    ),
                  ),
                  horizontalSpace,
                  Expanded(
                    child: AppDialogFormField<String>(
                      title: 'Date d\'sortie',
                      hint: 'Ajouter une date d\'sortie',
                      onSave: (val) =>
                          user.value = user.value.copyWith(deactivateDate: val),
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(Sizes.p16),
              AppText(
                text: 'Telechargez la carte d\'identite:',
                style: const TextStyle().bold,
              ),
              const VerticalSpacingWidget(Sizes.p4),
              Row(
                children: [
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.primary,
                    ),
                    child: const AppText(text: 'Telecharger La carte'),
                  ),
                  horizontalSpace,
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(),
                    child: AppText(
                      text: 'Voir La carte',
                      style: const TextStyle().colorize(Colors.black),
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
                      icon: Icons.edit,
                      color: colors.warning,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // ref
                          //     .read(userContorller.notifier)
                          //     .addCompanyuser(user);
                        }
                      },
                      text: 'Modifier',
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
