import 'package:flutter/material.dart';

class AppBorderedCircle extends StatelessWidget {
  const AppBorderedCircle(
      {super.key,
      required this.outerRadius,
      this.innerRadius,
      this.innerColor,
      this.outerColor,
      this.onTap,
      this.child}) // : assert(innerRadius != null ? innerRadius <= outerRadius : true)
  ;

  final Color? outerColor;
  final Color? innerColor;
  final double? innerRadius;
  final double outerRadius;
  final VoidCallback? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: outerRadius,
        backgroundColor: outerColor ?? Colors.black,
        child: CircleAvatar(
          radius: innerRadius ?? outerRadius - 1,
          backgroundColor: innerColor ?? Colors.white,
          child: child,
        ),
      ),
    );
  }
}
