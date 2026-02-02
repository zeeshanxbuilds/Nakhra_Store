import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/animations/onboardingAnimation/verification.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      repeat: true,
                      reverse: false,
                      animate: true,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// skip button

          /// dot Navigation smoothpageindicator

          /// circular button
        ],
      ),
    );
  }
}
