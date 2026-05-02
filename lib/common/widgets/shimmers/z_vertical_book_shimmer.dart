import 'package:flutter/material.dart';
import 'package:nakhra/common/widgets/shimmers/z_shimmer_effect.dart';

class ZVerticalBookShimmer extends StatelessWidget {
  const ZVerticalBookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130, // Should match the width of your ZBookCardVertical
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // The Image Shimmer
          ZShimmerEffect(width: 130, height: 180),
          SizedBox(height: 8),

          // The Title Shimmer
          ZShimmerEffect(width: 100, height: 15, radius: 4),
          SizedBox(height: 4),

          // The Price Shimmer
          ZShimmerEffect(width: 60, height: 15, radius: 4),
        ],
      ),
    );
  }
}
