import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.padding,
    this.maxLines,
  }) : onClick = null;

  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final int? maxLines;
  final String text;
  final TextOverflow? overflow;
  final TextStyle? style;
  final VoidCallback? onClick;

  const AppText.clickable({
    super.key,
    this.style,
    required this.text,
    required this.onClick,
    this.padding,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Text(
          text,
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
          style: style,
        ),
      ),
    );
  }
}
