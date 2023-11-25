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
    this.onTap,
  });
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? color;
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: color ?? context.appColors.background,
              shape: BoxShape.rectangle,
              borderRadius: borderRadius,
              border:
                  Border.all(color: borderColor ?? context.appColors.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: child),
            )),
      ),
    );
  }
}
