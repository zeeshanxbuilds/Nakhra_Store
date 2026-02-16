import 'package:flutter/material.dart';
import 'package:nakhra/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class OnboadingSkip extends StatelessWidget {
  const OnboadingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: ZSizes.defaultSpace,
      child: TextButton(onPressed: () => OnboardingController.instance.skipPage(), child: const Text('Skip')),
    );
  }
}
