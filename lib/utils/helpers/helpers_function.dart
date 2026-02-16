import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ZhelperFunction {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext banana) {
    return MediaQuery.of(banana).size.width;
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
