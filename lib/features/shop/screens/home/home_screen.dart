import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/screens/home/widgets/book_card_vertical.dart';
import 'package:nakhra/common/widgets/texts/z_home_screen_section_heading.dart';
// import 'package:nakhra/common/styles/spacing_styles.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/features/shop/screens/home/widgets/promotion_slider.dart';
import 'package:nakhra/features/shop/screens/home/widgets/z_author_profile_oval.dart';
import 'package:nakhra/features/shop/screens/home/widgets/z_vendor_card.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/constants/text_strings.dart';
import 'package:nakhra/utils/helpers/custom_scroll_physics.dart';

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
              HomeAppbar(title: ZTexts.homeAppbarTitle, leading: () {}, action: () {}),
              Expanded(
                child: SingleChildScrollView(
                  physics: CustomBouncingScrollPhysics(),

                  child: Column(
                    children: [
                      Padding(
                        // padding: ZSpacingStyle.leftRightPadding,
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: ZSizes.md),

                            ///Promotion Section
                            PromotionSlider(),
                            const SizedBox(height: ZSizes.sm),

                            ///Top of the Week Book Section
                            ZHomeScreenSectionHeading(title: "Top of Week", onPressed: () {}),

                            // const SizedBox(height: ZSizes.xs),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 210,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const CustomBouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder: (context, index) {
                            return const ZBookCardVertical(
                              imagePath: ZImages.tOWSectionImage1,
                              bookTitle: "The Kite Runner",
                              bookPrice: "\$14.99",
                            );
                          },
                          // ignore: unnecessary_underscores
                          separatorBuilder: (_, __) => const SizedBox(width: 16),
                          itemCount: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: ZSizes.xs),
                            ZHomeScreenSectionHeading(title: "Best Vendors", onPressed: () {}),
                            const SizedBox(height: 1),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 85,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          physics: CustomBouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const ZVendorCard(image: ZImages.vendorlogo1);
                          },
                          // ignore: unnecessary_underscores
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemCount: 8,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: ZHomeScreenSectionHeading(title: "Authors", onPressed: () {}),
                      ),
                      SizedBox(
                        height: 85,
                        child: ListView.separated(
                          physics: CustomBouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder: (context, index) {
                            return const ZAuthorProfileOval(image: ZImages.authorImage1);
                          },
                          // ignore: unnecessary_underscores
                          separatorBuilder: (_, __) => const SizedBox(width: 15),
                          itemCount: 8,
                        ),
                      ),
                      SizedBox(height: ZSizes.defaultSpace),
                    ],
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
