import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZVendorCard extends StatelessWidget {
  final image;
  const ZVendorCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ZColors.grey10, borderRadius: BorderRadius.circular(12)),
      height: 85,
      width: 85,
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
          child: SvgPicture.asset(image, height: 24, width: 24, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
