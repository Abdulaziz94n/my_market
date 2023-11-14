import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

final _borderRadius = BorderRadius.circular(50);

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.hint,
    this.contentPadding,
    this.value,
    this.isDense = true,
    this.isExpanded = true,
    this.onChanged,
    this.height,
    this.textAlign,
  });
  final List<DropdownMenuItem<T>> items;
  final bool isDense;
  final bool isExpanded;
  final T? value;
  final Function(T?)? onChanged;
  final EdgeInsets? contentPadding;
  final double? height;
  final String hint;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DropdownButtonFormField(
        value: value,
        items: items,
        onChanged: onChanged,
        hint: SizedBox(
          width: double.infinity,
          child: Text(
            hint,
            textAlign: textAlign ?? TextAlign.center,
          ),
        ),
        style: context.appTextTheme.bodySmall,
        isDense: isDense,
        isExpanded: isExpanded,
        borderRadius: _borderRadius,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
          focusedBorder: OutlineInputBorder(borderRadius: _borderRadius),
          disabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
          errorBorder: OutlineInputBorder(borderRadius: _borderRadius),
        ),
      ),
    );
  }
}
