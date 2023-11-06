import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
  });
  final String text;
  final double height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.appColors.primary,
        ),
        onPressed: onPressed,
        child: AppText(
          text: text,
          style: TextStyle(color: context.appColors.onPrimary),
        ),
      ),
    );
  }
}
