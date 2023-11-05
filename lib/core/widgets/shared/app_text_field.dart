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
  })  : initialValue = null,
        assert(controller != null);

  final TextEditingController? controller;
  final bool? enabled;
  final bool? obscure;
  final String label;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? initialValue;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
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
  }) : controller = null;

  const AppTextField.withControllerAndOnChanged({
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
    this.controller,
    this.contentPadding,
    this.validator,
    this.suffixIcon,
  }) : initialValue = null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        // height: Sizes.kTextFieldHeight,
        child: TextFormField(
          initialValue: initialValue,
          obscureText: obscure ?? false,
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
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kBorderRadius),
        borderSide: const BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(_kBorderRadius),
      ),
    );
  }
}
