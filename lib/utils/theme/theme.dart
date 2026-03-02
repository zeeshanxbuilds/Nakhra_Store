import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/theme/custom_themes/appbar_theme.dart';
import 'package:nakhra/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:nakhra/utils/theme/custom_themes/text_theme.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: ZColors.primary500,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ZColors.primary500,
      brightness: Brightness.light,
      primary: ZColors.primary500,
      surface: ZColors.lightBackground,
      error: ZColors.error,
    ),
    scaffoldBackgroundColor: ZColors.lightBackground,
    textTheme: ZTextTheme.lightTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: ZColors.primary500,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ZColors.primary500,
      brightness: Brightness.dark,
      primary: ZColors.primary500,
      surface: ZColors.darkBackground,
      error: ZColors.error,
    ),
    scaffoldBackgroundColor: ZColors.darkBackground,
    textTheme: ZTextTheme.darkTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.darkAppBarTheme,
  );
}
