import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kBorderRadius = 50.0;

class AppTextField extends StatelessWidget {
  const AppTextField.withController({
    super.key,
    required this.controller,
    required this.hint,
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
    this.hintStyle,
    this.textAlign,
    this.focusNode,
    this.onFieldSubmitted,
    this.hideUnderline = false,
  })  : initialValue = null,
        assert(controller != null);

  final TextEditingController? controller;
  final bool? enabled;
  final bool? readOnly;
  final bool? obscure;
  final String hint;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? fontSize;
  final double? width;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? initialValue;
  final TextInputType? inputType;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool hideUnderline;
  final void Function(String)? onFieldSubmitted;

  const AppTextField.withOnChanged({
    super.key,
    required this.onChanged,
    required this.hint,
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
    this.hintStyle,
    this.textAlign,
    this.hideUnderline = false,
    this.focusNode,
    this.onFieldSubmitted,
  }) : controller = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: readOnly == true ? onTap : null,
        child: TextFormField(
          focusNode: focusNode,
          initialValue: initialValue,
          obscureText: obscure ?? false,
          readOnly: readOnly ?? false,
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          style: TextStyle(fontSize: fontSize),
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          keyboardType: inputType,
          maxLines: maxLines ?? 1,
          validator: validator,
          decoration: _decoration(context),
          inputFormatters: inputFormatters,
          textAlign: textAlign ?? TextAlign.center,
        ),
      ),
    );
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      border: hideUnderline
          ? const UnderlineInputBorder(borderSide: BorderSide.none)
          : null,
      hintText: hint,
      hintStyle: hintStyle,
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minWidth: 35, maxWidth: 40),
      suffixIcon: suffixIcon,
      isDense: isDense,
      contentPadding: contentPadding,
      errorMaxLines: 2,
    );
  }
}
