import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

final _borderRadius = BorderRadius.circular(50);

class AppRoundedTextField extends StatelessWidget {
  const AppRoundedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.maxLines,
    this.fontSize,
    this.width,
    this.contentPadding,
    this.isDense = true,
    this.initialValue,
    this.inputType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final bool readOnly;
  final bool enabled;
  final bool? obscure;
  final String hintText;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? fontSize;
  final double? width;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? initialValue;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.appTextTheme.bodySmall,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: contentPadding,
        hintText: hintText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
        focusedBorder: OutlineInputBorder(borderRadius: _borderRadius),
        disabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
        errorBorder: OutlineInputBorder(borderRadius: _borderRadius),
      ),
    );
  }
}
