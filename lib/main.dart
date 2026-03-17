import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:nakhra/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:nakhra/home_menu_getx.dart';
import 'package:nakhra/utils/theme/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      statusBarIconBrightness: Brightness.dark,
      //bottom bar
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // ...

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
