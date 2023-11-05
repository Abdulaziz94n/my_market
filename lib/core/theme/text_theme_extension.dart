import 'package:flutter/material.dart';

class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  final TextStyle unselectedTitle;
  final TextStyle unselectedSubTitle;
  final TextStyle dateStyle;
  final TextStyle tinyText;
  TextThemeExtension({
    required this.unselectedTitle,
    required this.unselectedSubTitle,
    required this.dateStyle,
    required this.tinyText,
  });

  @override
  ThemeExtension<TextThemeExtension> copyWith({
    TextStyle? unselectedTitle,
    TextStyle? unselectedSubTitle,
    TextStyle? dateStyle,
    TextStyle? tinyText,
  }) {
    return TextThemeExtension(
      unselectedTitle: unselectedTitle ?? this.unselectedTitle,
      unselectedSubTitle: unselectedSubTitle ?? this.unselectedSubTitle,
      dateStyle: dateStyle ?? this.dateStyle,
      tinyText: tinyText ?? this.tinyText,
    );
  }

  @override
  ThemeExtension<TextThemeExtension> lerp(
      covariant ThemeExtension<TextThemeExtension>? other, double t) {
    if (other is! TextThemeExtension) {
      return this;
    }
    return TextThemeExtension(
        unselectedTitle:
            TextStyle.lerp(unselectedTitle, other.unselectedTitle, t)!,
        dateStyle: TextStyle.lerp(dateStyle, other.dateStyle, t)!,
        tinyText: TextStyle.lerp(tinyText, other.tinyText, t)!,
        unselectedSubTitle:
            TextStyle.lerp(unselectedSubTitle, other.unselectedSubTitle, t)!);
  }
}
