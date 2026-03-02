import 'package:flutter/material.dart';
import 'package:nakhra/common/styles/spacing_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Screen"),
              TextField(),
              const SizedBox(height: 500),
              TextField(),
              const SizedBox(height: 500),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
