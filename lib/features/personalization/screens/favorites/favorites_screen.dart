import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/personalization/controllers/favorites_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites"), centerTitle: true),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text("You have no favorite books yet."));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.favorites.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final book = controller.favorites[index];
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
              ),
              child: Row(
                children: [
                  // Rounded Square Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: book.coverImageUrl,
                      width: 70,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Title and Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "\$${book.price}",
                          style: Theme.of(context).textTheme.titleLarge!.apply(color: ZColors.primary500),
                        ),
                      ],
                    ),
                  ),
                  // Heart Action Button
                  IconButton(
                    onPressed: () => controller.toggleFavorite(book),
                    icon: SvgPicture.asset(
                      ZImages.yourFavoritesIcon, // Use filled heart SVG here if you have it!
                      height: 28,
                      width: 28,
                      colorFilter: const ColorFilter.mode(ZColors.primary500, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
