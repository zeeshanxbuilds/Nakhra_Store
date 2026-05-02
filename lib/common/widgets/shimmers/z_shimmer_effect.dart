import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ZShimmerEffect({super.key, required this.width, required this.height, this.radius = 15});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
