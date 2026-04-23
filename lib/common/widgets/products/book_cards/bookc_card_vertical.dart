import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/constants/colors.dart';

class BookcCardVertical extends StatelessWidget {
  final BookModel book;
  const BookcCardVertical({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: CachedNetworkImage(
              imageUrl: book.coverImageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            // child: Image.network(
            //   book.coverImageUrl,
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          book.title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: ZColors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Text(
          "\$${book.price.toStringAsFixed(2)}",
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: ZColors.primary500, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
