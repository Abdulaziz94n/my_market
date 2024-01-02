import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_market/core/widgets/shared/app_bordered_text_field.dart';

import '/core/constants/sizes.dart';
import '/core/extensions/list_extenstion.dart';
import '/core/widgets/shared/app_dropdown.dart';
import '/core/widgets/shared/app_text.dart';
import '/core/widgets/shared/spacing_widgets.dart';

class AppDialogFormField<T> extends StatelessWidget {
  AppDialogFormField({
    super.key,
    required this.title,
    required this.hint,
    this.onTextChanged,
    this.onSave,
    this.asDropDown,
    this.icon,
    this.textFieldValidator,
    this.inputType,
    this.inputFormatter,
    this.initialValue,
    this.readOnly,
    this.textAlign = TextAlign.start,
  }) : assert(asDropDown?.onChanged == null || onSave == null);

  final String title;
  final String hint;
  final ValueChanged<String>? onTextChanged;
  final String? initialValue;
  final TextAlign? textAlign;
  final String? Function(String?)? textFieldValidator;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatter;
  final bool? readOnly;
  final ({
    bool isDropDown,
    List<T> items,
    T? value,
    void Function(T?)? onChanged,
    Widget Function(T) childBuilder,
    String? Function(T?)? dropDownvalidator,
  })? asDropDown;
  final ValueChanged<String?>? onSave;
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
            readOnly: readOnly ?? false,
            initialValue: initialValue,
            hintText: hint,
            textAlign: textAlign,
            inputType: inputType,
            inputFormatters: inputFormatter,
            onChanged: onTextChanged,
            onSave: onSave,
            prefixIcon: Icon(icon ?? Icons.abc),
            validator: textFieldValidator,
          ),
        if (asDropDown != null)
          AppDropDown(
            value: asDropDown!.value,
            items: asDropDown!.items.toDropdownItems(
              childBuilder: asDropDown!.childBuilder,
            ),
            onChanged: asDropDown!.onChanged,
            hint: hint,
            validator: asDropDown!.dropDownvalidator,
            enabled: true,
          )
      ],
    );
  }
}
