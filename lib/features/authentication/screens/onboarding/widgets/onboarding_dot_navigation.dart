import 'package:flutter/material.dart';
import 'package:nakhra/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/device/device_utility.dart';
import 'package:nakhra/utils/helpers/helpers_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = ZhelperFunction.isDark(context);

    return Positioned(
      bottom: ZDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: ZSizes.defaultSpace,

      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark ? ZColors.lightBackground : ZColors.dark, dotHeight: 6),
      ),
    );
  }
}
