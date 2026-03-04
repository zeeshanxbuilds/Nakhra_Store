import 'package:flutter/material.dart';
// import 'package:nakhra/common/styles/spacing_styles.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/features/shop/screens/home/widgets/promotion_slider.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
          // padding: ZSpacingStyle.paddingWithoutAppBarHeight,
          child: Column(
            children: [
              const HomeAppbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    // padding: ZSpacingStyle.leftRightPadding,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: ZSizes.defaultSpace),
                        PromotionSlider(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
