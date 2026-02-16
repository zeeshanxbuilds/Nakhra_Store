import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/helpers/helpers_function.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.lottieAnimation,
    required this.title,
    required this.subtitle,
    required this.animationHeight,
    required this.animationWidth,
  });

  final String lottieAnimation, title, subtitle;
  final double animationHeight, animationWidth;
  @override
  Widget build(BuildContext context) {
    final double lottieHeight = ZhelperFunction.screenHeight(context) * animationHeight;
    final double lottieWidth = ZhelperFunction.screenWidth(context) * animationWidth;
    return Padding(
      padding: const EdgeInsets.all(ZSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieAnimation,
            // 'assets/animations/onboardingAnimation/verification.json',
            // width: ZhelperFunction.screenWidth(context) * 0.83,
            width: lottieWidth,
            // height: ZhelperFunction.screenHeight(context) * 0.40,
            height: lottieHeight,
            fit: BoxFit.fill,
            repeat: true,
            frameRate: FrameRate(60),
            reverse: false,
            animate: true,
          ),

          const SizedBox(height: ZSizes.spaceBtwItems),

          // const SizedBox(height: ZSizes.spaceBtwSections),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),

          const SizedBox(height: ZSizes.spaceBtwItems),

          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
