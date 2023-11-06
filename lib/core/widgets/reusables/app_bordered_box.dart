import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

class AppBorderedBox extends StatelessWidget {
  const AppBorderedBox.withIcon({
    super.key,
    required this.width,
    required this.height,
    this.innerPadding,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.boxShape,
    this.background,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.onTap,
    this.border,
  }) : child = null;

  const AppBorderedBox.withChild({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.onTap,
    this.boxShape,
    this.background,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.innerPadding,
    this.border,
  })  : icon = null,
        iconColor = null,
        iconSize = null;

  final double? width;
  final double? height;
  final BoxBorder? border;
  final EdgeInsets? innerPadding;
  final BoxShape? boxShape;
  final Color? background;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Widget? child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0),
                color: Colors.white10,
              ),
            ],
            shape: boxShape ?? BoxShape.rectangle,
            borderRadius: border == null
                ? boxShape == BoxShape.circle
                    ? null
                    : BorderRadius.circular(borderRadius ?? 0)
                : null,
            color: background,
            border: border ??
                Border.all(
                  width: borderWidth ?? 1,
                  color: borderColor ?? context.appColors.primary,
                ),
          ),
          child: Padding(
            padding: innerPadding ?? const EdgeInsets.all(0),
            child: child ??
                Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
