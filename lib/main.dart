import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nakhra/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(themeMode: ThemeMode.system, theme: ZAppTheme.lightTheme, darkTheme: ZAppTheme.DarkTheme);
  }
}
