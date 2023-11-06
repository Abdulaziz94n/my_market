import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color error;
  final Color success;
  final Color warning;
  final Color black;
  final Color white;
  final Color grey;
  final Color blue;
  final Color background;
  final Color primary;
  final Color secondary;
  final Color onBackground;
  final Color onPrimary;
  final Color onSecondary;
  final Color inActive;
  final Color active;
  const AppColorsExtension({
    required this.success,
    required this.error,
    required this.warning,
    required this.black,
    required this.white,
    required this.grey,
    required this.blue,
    required this.background,
    required this.primary,
    required this.secondary,
    required this.onBackground,
    required this.onPrimary,
    required this.onSecondary,
    required this.inActive,
    required this.active,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? error,
    Color? success,
    Color? warning,
    Color? black,
    Color? white,
    Color? grey,
    Color? blue,
    Color? background,
    Color? primary,
    Color? secondary,
    Color? onBackground,
    Color? onPrimary,
    Color? onSecondary,
    Color? inActive,
    Color? active,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      black: black ?? this.black,
      white: white ?? this.white,
      grey: grey ?? this.grey,
      blue: blue ?? this.blue,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      onBackground: onBackground ?? this.onBackground,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      inActive: inActive ?? this.inActive,
      active: active ?? this.active,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      inActive: Color.lerp(inActive, other.inActive, t)!,
      active: Color.lerp(active, other.active, t)!,
    );
  }
}
