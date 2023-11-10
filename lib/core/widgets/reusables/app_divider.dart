import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.color,
    this.height,
    this.thickness,
    this.endIndent,
    this.indent,
  });
  final Color? color;
  final double? height;
  final double? thickness;
  final double? endIndent;
  final double? indent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.black26,
      height: height ?? 1.0,
      thickness: thickness ?? 1,
      endIndent: endIndent,
      indent: indent,
    );
  }
}
