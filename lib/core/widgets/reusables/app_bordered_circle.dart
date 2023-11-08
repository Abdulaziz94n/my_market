import 'package:flutter/material.dart';

class AppBorderedCircle extends StatelessWidget {
  const AppBorderedCircle({
    super.key,
    required this.radius,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.child,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final double radius;
  final VoidCallback? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(
              color: borderColor ?? Colors.black,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
