import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:nakhra/utils/constants/colors.dart';
// import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class ZPromotionCard extends StatelessWidget {
  final String discountPercentage;
  final String promotionslideImage;
  const ZPromotionCard({super.key, required this.discountPercentage, required this.promotionslideImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ZColors.primary100_50opacity, borderRadius: BorderRadius.circular(9)),
      clipBehavior: Clip.hardEdge,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 12, bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  ZTexts.specialOffer,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 22),
                ),
                const SizedBox(height: ZSizes.xs),
                Text(discountPercentage, style: Theme.of(context).textTheme.bodyMedium),
                // SizedBox(height: ZSizes.defaultSpace),
                const Spacer(),
                SizedBox(
                  width: 150,
                  height: 43,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 11)),
                    onPressed: () {},
                    child: Text(ZTexts.orderNow),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9),
                bottomLeft: Radius.circular(9),
                topRight: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),

              child: Image.asset(promotionslideImage, height: 180, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
