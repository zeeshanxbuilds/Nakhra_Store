import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/home_menu_getx.dart';
import 'package:nakhra/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      home: ZBottomNavigationBar(),
    );
  }
}
