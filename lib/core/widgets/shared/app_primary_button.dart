import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizes.defaultButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.appColors.primary,
        ),
        onPressed: onPressed,
        child: AppText(
          text: text,
          style: textStyle ?? TextStyle(color: context.appColors.onPrimary),
        ),
      ),
    );
  }
}
