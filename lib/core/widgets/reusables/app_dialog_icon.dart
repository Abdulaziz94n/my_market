import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_circle.dart';

class AppDialogIcon extends StatelessWidget {
  const AppDialogIcon({
    super.key,
    required this.icon,
    required this.color,
  });
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AppBorderedCircle(
      radius: 40,
      borderColor: color,
      backgroundColor: Colors.transparent,
      child: Icon(
        icon,
        size: Sizes.p48,
        color: color,
      ),
    );
  }
}
