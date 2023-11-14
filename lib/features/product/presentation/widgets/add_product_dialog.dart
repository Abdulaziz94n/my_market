import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/shared/app_dropdown.dart';
import 'package:my_market/core/widgets/shared/app_primary_button.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field_bordered.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AddProductDialog extends ConsumerWidget {
  const AddProductDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    const horizontalSpace = HorizontalSpacingWidget(Sizes.p16);
    return SizedBox(
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
                  child: _ProductField(
                    title: 'Code Bare',
                    hint: '1558475654',
                    onSumbitted: (value) {},
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: _ProductField(
                    title: 'Nom de Produit',
                    hint: 'Danetter Chocolat 55ml',
                    onSumbitted: (value) {},
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(Sizes.p16),
            Row(
              children: [
                Expanded(
                  child: _ProductField(
                    title: 'Code Bare',
                    hint: '1558475654',
                    onSumbitted: (value) {},
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: _ProductField(
                    title: 'Nom de Produit',
                    hint: 'Danetter Chocolat 55ml',
                    onSumbitted: (value) {},
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: _ProductField(
                    title: 'Nom de Produit',
                    hint: 'Danetter Chocolat 55ml',
                    onSumbitted: (value) {},
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: _ProductField(
                    title: 'Nom de Produit',
                    hint: 'Danetter Chocolat 55ml',
                    onSumbitted: (value) {},
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(Sizes.p16),
            Row(
              children: [
                Expanded(
                  child: _ProductField(
                    title: 'Code Bare',
                    hint: '1558475654',
                    onSumbitted: (value) {},
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: _ProductField(
                    title: 'Nom de Produit',
                    hint: 'Danetter Chocolat 55ml',
                    onSumbitted: (value) {},
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(Sizes.p32),
            Row(
              children: [
                horizontalSpace,
                Expanded(
                  child: AppPrimaryButton.icon(
                    icon: Icons.add,
                    color: colors.success,
                    onPressed: () {},
                    text: 'Enregistrer',
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: AppPrimaryButton.icon(
                    icon: Icons.close,
                    color: colors.error,
                    onPressed: () {},
                    text: 'Annuler',
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: AppPrimaryButton.icon(
                    icon: Icons.close,
                    onPressed: () {},
                    text: 'Imprimer le prix',
                  ),
                ),
                horizontalSpace,
                Expanded(
                  child: AppPrimaryButton.icon(
                    icon: Icons.close,
                    text: 'Imprimer le QR',
                    onPressed: () {},
                  ),
                ),
                horizontalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductField<T> extends StatelessWidget {
  const _ProductField({
    super.key,
    required this.title,
    required this.hint,
    required this.onSumbitted,
    this.asDropDown,
    this.icon,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final String hint;
  final TextAlign? textAlign;
  final ({
    bool isDropDown,
    List<T> items,
    T value,
    T Function(T?)? onChanged,
    Widget Function(T) childBuilder,
  })? asDropDown;
  final ValueChanged<String>? onSumbitted;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: '$title:',
        ),
        const VerticalSpacingWidget(Sizes.p4),
        if (asDropDown == null)
          AppBorderedTextField(
            hintText: hint,
            textAlign: textAlign,
            onFieldSubmitted: onSumbitted,
            prefixIcon: Icon(icon ?? Icons.abc),
          ),
        if (asDropDown != null)
          AppDropDown(
            value: asDropDown!.value,
            items: asDropDown!.items.toDropdownItems(
              childBuilder: asDropDown!.childBuilder,
            ),
            onChanged: asDropDown!.onChanged,
            hint: hint,
          )
      ],
    );
  }
}
