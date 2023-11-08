import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

class AppRoundedBox extends StatelessWidget {
  const AppRoundedBox({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderColor,
    this.color,
  });
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: color ?? context.appColors.background,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: borderColor ?? context.appColors.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: child),
          )),
    );
  }
}
