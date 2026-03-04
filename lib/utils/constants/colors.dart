import 'package:flutter/material.dart';

class ZColors {
  // App theme colors

  ZColors._();

  // ===========================================================================
  // GRAYSCALE
  // Used for text, backgrounds, borders, and neutral elements.
  // ===========================================================================
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFE8E8E8);
  static const Color gray300 = Color(0xFFD6D6D6);
  static const Color gray400 = Color(0xFFB8B8B8);
  static const Color gray500 = Color(0xFFA6A6A6);
  static const Color gray600 = Color(0xFF7A7A7A);
  static const Color gray700 = Color(0xFF454545);
  static const Color gray800 = Color(0xFF292929);
  static const Color gray900 = Color(0xFF121212);

  // ===========================================================================
  // PRIMARY (Purple Scale)
  // Used for main buttons, active states, and brand identity.
  // ===========================================================================
  static const Color primary50 = Color(0xFFFAF9FD);
  static const Color primary100 = Color(0xFFE5DEF8);
  static const Color primary100_50opacity = Color.fromARGB(133, 229, 222, 248);
  static const Color primary200 = Color(0xFFCABCEF);
  static const Color primary300 = Color(0xFFA28CE0);
  static const Color primary400 = Color(0xFF7D64C3);
  static const Color primary500 = Color(0xFF54408C);
  static const Color primary600 = Color(0xFF352368);
  static const Color primary700 = Color(0xFF251554);
  static const Color primary800 = Color(0xFF10052F);
  static const Color primary900 = Color(0xFF09031B);

  // ===========================================================================
  // ADDITIONAL COLORS
  // Used for alerts (Red), success states (Green/Blue), or warnings (Orange).
  // ===========================================================================

  static const Color yellow = Color(0xFFFBAE05);
  static const Color orange = Color(0xFFFF8C39);
  static const Color red = Color(0xFFEF5A56);
  static const Color blue = Color(0xFF3784FB);

  // ===========================================================================
  // ===========================================================================

  static const Color primary = Color(0XFF4b68ff);
  // ignore: use_full_hex_values_for_flutter_colors
  static const Color secondary = Color(0xfffffe24b);
  static const Color secondaryLight = Color(0xC9346DAE);
  static const Color primaryBackground = Color(0xFFCCFBF1); // Primary Color Background
  static const Color secondaryBackground = Color(0xFFFFE4E6); // Secondary Color Background
  static const Color accent = Color(0xFFb0c7ff);

  // Dashboard Specific Colors
  static const Color dashboardAppbarBackground = Color(0xFF4b68ff);

  // Text colors
  static const Color textPrimary = Color(0xFF222A3D); // Theme Nightingale Gray 80
  static const Color textSecondary = Color(0xFF4B5363); // Theme Nightingale Gray 60
  static const Color textDarkPrimary = Color(0xFFFFFFFF); // Theme Nightingale Gray White
  static const Color textDarkSecondary = Color(0xFFD1D5DB); // Theme Nightingale Gray 30
  static const Color textWhite = Colors.white;

  static const Color disabledTextLight = Color(0xFFD1D5DB); // Theme Nightingale Gray 30
  static const Color disabledBackgroundLight = Color(0xFFF3F4F6); // Theme Nightingale Gray ?

  static const Color disabledTextDark = textSecondary; // Theme Nightingale Gray 60
  static const Color disabledBackgroundDark = Color(0xFF222A3D); // Theme Nightingale Gray 80

  // Background colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF02040A); // Theme Nightingale Gray 100

  // Background Container colors
  static const Color lightContainer = Color(0xFFF3F4F6); // Theme Nightingale Gray 10
  static const Color darkContainer = Color(0xFF13192B); // Theme Nightingale Gray 90
  static const Color cardBackgroundColor = Color(0xFFF7F5F1); // Theme Nightingale Gray 90

  // Button colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = disabledBackgroundLight;

  // -- Social Button Colors
  static const Color googleBackgroundColor = Color(0xFFDFEFFF);
  static const Color googleForegroundColor = Color(0xFF167EE6);
  static const Color facebookBackgroundColor = Color(0xFF1877F2);

  // -- ON-BOARDING COLORS
  static const Color onBoardingPage1Color = Colors.white;
  static const Color onBoardingPage2Color = Color(0xfffddcdf);
  static const Color onBoardingPage3Color = Color(0xffffdcbd);

  // Icon colors
  static const Color iconPrimaryLight = Color(0xFF284C76); // Theme Nightingale Gray 80
  static const Color iconSecondaryLight = Color(0xFF9CA3AF); // Theme Nightingale Gray 40
  static const Color iconPrimaryDark = Color(0xFFFFFFFF); // Theme Nightingale Gray White
  static const Color iconSecondaryDark = Color(0xFF9CA3AF); // Theme Nightingale Gray 40

  // Border colors
  static const Color borderPrimary = primary;
  static const Color borderSecondary = secondary;
  static const Color borderLight = Color(0xFFD1D5DB); // Gray 30
  static const Color borderDark = Color(0xFF9CA3AF); // Gray 40

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color teal90 = Color(0xFF004D40);
  static const Color teal80 = Color(0xFF00695C);
  static const Color teal20 = Color(0xFF99F6E4);
  static const Color dark = Color(0xff272727);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color grey10 = Color(0xFFF3F4F6);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
