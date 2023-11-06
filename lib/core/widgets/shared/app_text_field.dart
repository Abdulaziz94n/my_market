import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kBorderRadius = 50.0;

class AppTextField extends StatelessWidget {
  const AppTextField.withController({
    super.key,
    required this.controller,
    required this.label,
    this.inputFormatters,
    this.enabled,
    this.prefixIcon,
    this.maxLines,
    this.fontSize,
    this.inputType,
    this.onChanged,
    this.isDense,
    this.obscure,
    this.contentPadding,
    this.validator,
    this.suffixIcon,
    this.width,
    this.readOnly,
    this.onTap,
  })  : initialValue = null,
        assert(controller != null);

  final TextEditingController? controller;
  final bool? enabled;
  final bool? readOnly;
  final bool? obscure;
  final String label;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? fontSize;
  final double? width;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? initialValue;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const AppTextField.withOnChanged({
    super.key,
    required this.onChanged,
    required this.label,
    this.inputFormatters,
    this.obscure,
    this.enabled,
    this.prefixIcon,
    this.maxLines,
    this.fontSize,
    this.inputType,
    this.isDense,
    this.initialValue,
    this.contentPadding,
    this.validator,
    this.suffixIcon,
    this.width,
    this.readOnly,
    this.onTap,
  }) : controller = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: readOnly == true ? onTap : null,
        child: TextFormField(
          initialValue: initialValue,
          obscureText: obscure ?? false,
          readOnly: readOnly ?? false,
          enabled: enabled,
          controller: controller,
          style: TextStyle(fontSize: fontSize),
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          keyboardType: inputType,
          maxLines: maxLines ?? 1,
          validator: validator,
          decoration: _decoration(context),
          inputFormatters: inputFormatters,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minWidth: 35, maxWidth: 40),
      suffixIcon: suffixIcon,
      isDense: isDense,
      contentPadding: contentPadding,
      errorMaxLines: 2,
    );
  }
}
