import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nakhra/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:nakhra/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:nakhra/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:nakhra/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:nakhra/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // This is the lottie animation
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(
                  lottieAnimation: ZImages.onBoardingImage1,
                  title: ZTexts.zOnBoardingTitle1,
                  subtitle: ZTexts.zOnBoardingSubTitle1,
                  animationHeight: 0.360,
                  animationWidth: 0.590,
                ),
                OnboardingPage(
                  lottieAnimation: ZImages.onBoardingImage2,
                  title: ZTexts.zOnBoardingTitle2,
                  subtitle: ZTexts.zOnBoardingSubTitle2,
                  animationHeight: 0.360,
                  animationWidth: 0.890,
                ),
                OnboardingPage(
                  lottieAnimation: ZImages.onBoardingImage3,
                  title: ZTexts.zOnBoardingTitle3,
                  subtitle: ZTexts.zOnBoardingSubTitle3,
                  animationHeight: 0.390,
                  animationWidth: 0.900,
                ),
              ],
            ),
            // This is the skip button
            const OnboadingSkip(),
            // here it is smooth page indicator
            const OnBoardingDotNavigation(),
            // now here is the circular button
            const OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
