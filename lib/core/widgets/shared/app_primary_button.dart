import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.textStyle,
    this.color,
  }) : icon = null;

  const AppPrimaryButton.icon({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.height,
    this.textStyle,
    this.color,
  });

  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final double? height;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizes.defaultButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? context.appColors.primary,
        ),
        onPressed: onPressed,
        child: icon == null
            ? AppText(
                text: text,
                style:
                    textStyle ?? TextStyle(color: context.appColors.onPrimary),
              )
            : Row(
                children: [
                  Icon(icon, color: context.appColors.onPrimary),
                  const HorizontalSpacingWidget(Sizes.p8),
                  Expanded(
                    child: AppText(
                      text: text,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          TextStyle(color: context.appColors.onPrimary),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
