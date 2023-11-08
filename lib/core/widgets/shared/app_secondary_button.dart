import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.textStyle,
  });
  final String text;
  final double? height;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizes.defaultButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.background,
            shape: RoundedRectangleBorder(
                borderRadius: Sizes.defaultBorderRadius,
                side: BorderSide(color: context.appColors.primary))),
        onPressed: onPressed,
        child: AppText(
          text: text,
          style: textStyle ?? TextStyle(color: context.appColors.onBackground),
        ),
      ),
    );
  }
}
