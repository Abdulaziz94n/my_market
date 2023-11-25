import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';

import '/core/theme/colors_palette.dart';
import '/core/theme/colors_palette_extension.dart';
import '/core/theme/text_styles.dart';
import '/core/theme/text_theme_extension.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(backgroundColor: AppColorsPalette.primary),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColorsPalette.primary)),
    ),
    buttonTheme: const ButtonThemeData(),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: Sizes.defaultBorderRadius)),
    fontFamily: null, // replace with font family name,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.h1,
      headlineMedium: AppTextStyles.h2,
      headlineSmall: AppTextStyles.h3,
      titleLarge: AppTextStyles.t1,
      titleMedium: AppTextStyles.t2,
      titleSmall: AppTextStyles.t3,
      bodySmall: AppTextStyles.b3,
      bodyMedium: AppTextStyles.b2,
      bodyLarge: AppTextStyles.b1,
      labelSmall: AppTextStyles.label,
    ),
    extensions: [
      lightTextThemeExtension,
      lightThemeColorsExtension,
    ],
  );

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: null, // replace with font family name,
      scaffoldBackgroundColor: _darkThemeColorsExtension.background,
      textTheme: TextTheme(
        // TODO: Check Typography.black,white
        headlineLarge: AppTextStyles.h1.colorize(Colors.white),
        headlineMedium: AppTextStyles.h2.colorize(Colors.white),
        headlineSmall: AppTextStyles.h3.colorize(Colors.white),
        titleLarge: AppTextStyles.t1.colorize(Colors.white),
        titleMedium: AppTextStyles.t2.colorize(Colors.white),
        titleSmall: AppTextStyles.t3.colorize(Colors.white),
        bodySmall: AppTextStyles.b3.colorize(Colors.white),
        bodyMedium: AppTextStyles.b2.colorize(Colors.white),
        bodyLarge: AppTextStyles.b1.colorize(Colors.white),
        labelSmall: AppTextStyles.label.colorize(Colors.white),
      ),
      extensions: [
        _darkTextThemeExtension,
        _darkThemeColorsExtension,
      ]);

  static const lightThemeColorsExtension = AppColorsExtension(
    error: AppColorsPalette.red,
    success: AppColorsPalette.green,
    warning: AppColorsPalette.orange,
    black: AppColorsPalette.black,
    white: AppColorsPalette.white,
    grey: AppColorsPalette.grey,
    blue: AppColorsPalette.blue,
    background: AppColorsPalette.background,
    primary: AppColorsPalette.primary,
    secondary: AppColorsPalette.secondary,
    onBackground: AppColorsPalette.onBackground,
    onSecondary: AppColorsPalette.onSecondary,
    onPrimary: AppColorsPalette.onPrimary,
    active: AppColorsPalette.active,
    inActive: AppColorsPalette.inActive,
  );

  static const _darkThemeColorsExtension = AppColorsExtension(
    error: AppColorsPalette.red,
    success: AppColorsPalette.green,
    warning: AppColorsPalette.orange,
    white: AppColorsPalette.white,
    black: AppColorsPalette.black,
    grey: AppColorsPalette.grey,
    blue: AppColorsPalette.blue,
    background: AppColorsPalette.background,
    primary: AppColorsPalette.primary,
    secondary: AppColorsPalette.secondary,
    onBackground: AppColorsPalette.onBackground,
    onPrimary: AppColorsPalette.onPrimary,
    onSecondary: AppColorsPalette.onSecondary,
    inActive: AppColorsPalette.inActive,
    active: AppColorsPalette.active,
  );

  static final lightTextThemeExtension = TextThemeExtension(
    unselectedTitle: AppTextStyles.h2.colorize(AppColorsPalette.inActive),
    unselectedSubTitle: AppTextStyles.b3.colorize(AppColorsPalette.inActive),
    dateStyle: AppTextStyles.label.colorize(Colors.black),
    tinyText: AppTextStyles.label.colorize(Colors.black),
  );

  static final _darkTextThemeExtension = TextThemeExtension(
    unselectedTitle: AppTextStyles.h2.colorize(AppColorsPalette.inActive),
    unselectedSubTitle: AppTextStyles.b3.colorize(AppColorsPalette.inActive),
    dateStyle: AppTextStyles.label.colorize(Colors.black),
    tinyText: AppTextStyles.label.colorize(Colors.white),
  );
}
