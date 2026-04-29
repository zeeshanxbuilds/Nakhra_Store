import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nakhra/bindings/general_bindings.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/theme/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 🚨 TURN ON PATH B: OFFLINE PERSISTENCE 🚨
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true, // Turns on the hidden SQLite database!
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, // Gives it enough space to store cart items
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.dark,
        //bottom bar
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        themeMode: ThemeMode.light,
        theme: ZAppTheme.lightTheme,
        darkTheme: ZAppTheme.darkTheme,
        home: Scaffold(body: Center(child: Lottie.asset(ZImages.splashScreenLogo))),
      ),
    );
  }
}
