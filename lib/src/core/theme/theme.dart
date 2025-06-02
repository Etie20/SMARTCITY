import 'package:flutter/material.dart';
import 'package:smart_city/src/core/theme/app_pallete.dart';

class AppTheme {
  static _border([
    Color color = AppPallete.borderColor,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2.4,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
    appBarTheme: const AppBarTheme(
      color: AppPallete.backgroundColor,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none,
    ),
  );
}
