import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZElevatedButtonTheme {
  ZElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ZColors.primary500,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      // side: const BorderSide(color: Colors.blue),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(27)),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ZColors.primary500,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      // side: const BorderSide(color: Colors.blue),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(27)),
    ),
  );
}
