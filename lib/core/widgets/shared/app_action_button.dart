import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    this.color,
    required this.onPressed,
    required this.iconData,
    required this.text,
    this.isItemSelected = true,
  });
  final Color? color;
  final VoidCallback? onPressed;
  final IconData iconData;
  final String text;
  final bool isItemSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.p4),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: !isItemSelected ? null : onPressed,
        icon: Icon(iconData),
        label: AppText(text: text),
      ),
    );
  }
}
