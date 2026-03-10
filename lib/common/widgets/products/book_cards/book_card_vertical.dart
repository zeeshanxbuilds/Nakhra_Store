import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class ZBookCardVertical extends StatelessWidget {
  final String imagePath;
  final String bookTitle;
  final String bookPrice;
  const ZBookCardVertical({super.key, required this.imagePath, required this.bookTitle, required this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 127,
            clipBehavior: Clip.hardEdge,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: ZSizes.defaultSpace),
          Text(
            bookTitle,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: ZSizes.defaultSpace),
          Text(bookPrice, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: ZColors.primary500)),
        ],
      ),
    );
  }
}
