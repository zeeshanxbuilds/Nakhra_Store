import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nakhra/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/device/device_utility.dart';
import 'package:nakhra/utils/helpers/helpers_function.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZhelperFunction.isDark(context);
    return Positioned(
      right: ZSizes.defaultSpace,
      bottom: ZDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: dark ? ZColors.primary : Colors.black,
          side: const BorderSide(color: Colors.transparent),
        ),
        onPressed: () => OnboardingController.instance.nextPage(),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
