import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/screens/home/widgets/z_promotion_card.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class PromotionSlider extends StatelessWidget {
  const PromotionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          // height: 180,
          autoPlayAnimationDuration: Duration(milliseconds: 1600),
          autoPlayInterval: Duration(seconds: 8),
        ),
        items: [
          ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing1),
          ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing2),
          ZPromotionCard(discountPercentage: "Discount 25%", promotionslideImage: ZImages.testing3),
        ],
      ),
    );
  }
}
