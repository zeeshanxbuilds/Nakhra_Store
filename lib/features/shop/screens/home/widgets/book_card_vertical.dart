import 'package:cached_network_image/cached_network_image.dart';
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
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ZColors.primary300),
            clipBehavior: Clip.hardEdge,

            // child: Image.asset(imagePath, fit: BoxFit.cover),
            child: _buildSmartImage(),
          ),
          const SizedBox(height: ZSizes.sm),
          Text(
            bookTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: ZSizes.xs),
          Text(
            bookPrice,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: ZColors.primary400, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSmartImage() {
    if (imagePath.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.fill,
        // Equivalent to loadingBuilder
        // progressIndicatorBuilder: (context, url, downloadProgress) =>
        //     Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
        // Equivalent to errorBuilder
        errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      );
      // return Image.network(
      //   imagePath,
      //   fit: BoxFit.cover,
      //   errorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),
      //   loadingBuilder: (context, child, loadingProgress) {
      //     if (loadingProgress == null) return child;
      //     return Center(
      //       child: CircularProgressIndicator(
      //         value: loadingProgress.expectedTotalBytes != null
      //             ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
      //             : null,
      //       ),
      //     );
      //   },
      // );
    } else {
      return Image.asset(imagePath, fit: BoxFit.cover);
    }
  }
}
