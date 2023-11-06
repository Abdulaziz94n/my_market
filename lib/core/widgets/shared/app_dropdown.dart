import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

final _borderRadius = BorderRadius.circular(50);

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.hint,
    this.contentPadding,
    this.isDense = true,
    this.isExpanded = true,
    this.onChanged,
    this.height,
  });
  final List<DropdownMenuItem<T>> items;
  final bool isDense;
  final bool isExpanded;
  final Function(T?)? onChanged;
  final EdgeInsets? contentPadding;
  final double? height;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DropdownButtonFormField(
        items: items,
        onChanged: onChanged,
        hint: SizedBox(
          width: double.infinity,
          child: Text(
            hint,
            textAlign: TextAlign.center,
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
