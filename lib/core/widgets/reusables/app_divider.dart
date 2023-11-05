import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.height, this.thickness});
  final Color? color;
  final double? height;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.black54,
      height: height ?? 1.0,
      thickness: thickness ?? 0.8,
    );
  }
}
