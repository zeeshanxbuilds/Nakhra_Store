import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/controllers/home_controller.dart';
import 'package:nakhra/features/shop/screens/home/widgets/z_promotion_card.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class PromotionSlider extends StatelessWidget {
  const PromotionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              // height: 180,
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: false,

              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,

              onPageChanged: (index, reason) => controller.updatePageIndicator(index),
            ),
            items: [
              ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing1),
              ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing2),
              ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing3),
            ],
          ),
        ),
        const SizedBox(height: ZSizes.md),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  width: controller.crouselCurrentIndex.value == i ? 11.7 : 8,
                  height: controller.crouselCurrentIndex.value == i ? 11.7 : 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.crouselCurrentIndex.value == i ? ZColors.primary500 : ZColors.gray200,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
