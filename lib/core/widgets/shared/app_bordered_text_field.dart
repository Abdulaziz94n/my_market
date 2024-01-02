import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

final _borderRadius = BorderRadius.circular(50);

class AppBorderedTextField extends StatelessWidget {
  const AppBorderedTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscure,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.fontSize,
    this.width,
    this.contentPadding,
    this.isDense = true,
    this.initialValue,
    this.inputType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.textAlign,
    this.onFieldSubmitted,
    this.onSave,
    this.onTap,
    this.mouseCursor,
  }) : assert(initialValue == null || controller == null);

  final TextEditingController? controller;
  final bool readOnly;
  final bool enabled;
  final bool? obscure;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final double? fontSize;
  final double? width;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? initialValue;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSave;
  final VoidCallback? onTap;
  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      mouseCursor: mouseCursor,
      onTap: onTap,
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSave,
      validator: validator,
      style: context.appTextTheme.bodySmall,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.center,
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: contentPadding,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
        focusedBorder: OutlineInputBorder(borderRadius: _borderRadius),
        disabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
        errorBorder: OutlineInputBorder(borderRadius: _borderRadius),
      ),
    );
  }
}
