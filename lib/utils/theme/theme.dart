import 'package:flutter/material.dart';
import 'package:nakhra/utils/theme/custom_themes/appbar_theme.dart';
import 'package:nakhra/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:nakhra/utils/theme/custom_themes/text_theme.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ZTextTheme.lightTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.lightAppBarTheme,
  );

  static ThemeData DarkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ZTextTheme.darkTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ZAppBarTheme.darkAppBarTheme,
  );
}
