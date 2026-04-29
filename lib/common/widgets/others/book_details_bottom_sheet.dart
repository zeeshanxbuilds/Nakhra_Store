import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nakhra/features/personalization/controllers/favorites_controller.dart';
import 'package:nakhra/features/shop/controllers/cart_controller.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/home_screen_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

void zShowBookDetailsBottomSheet(BookModel book) {
  RxInt quantity = 1.obs;

  final cartController = Get.put(CartController());
  final bottomNavController = Get.find<ZBottomNavigationController>();
  final favoriteController = Get.put(FavoriteController());

  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(ZSizes.defaultSpace),
      decoration: BoxDecoration(
        color: ZColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(29)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(color: ZColors.gray400, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: book.coverImageUrl, // Accessing your dummy data field
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    book.title,
                    style: Theme.of(Get.context!).textTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Obx(() {
                  final isFav = favoriteController.isFavorite(book.id);
                  return IconButton(
                    onPressed: () => favoriteController.toggleFavorite(book),
                    icon: SvgPicture.asset(
                      // 1. Switch the icon shape
                      isFav ? ZImages.yourFavoritesIcon : ZImages.heartIconGreyColor,
                      height: 24,
                      width: 24,
                      // 2. Switch the paint color! Purple if favorite, Grey if not.
                      colorFilter: ColorFilter.mode(isFav ? ZColors.primary500 : Colors.grey, BlendMode.srcIn),
                    ),
                  );
                }),
              ],
            ),
            Text(
              book.vendorName,
              style: Theme.of(Get.context!).textTheme.titleMedium!.apply(color: Colors.orange),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Text(
              book.description,
              style: Theme.of(Get.context!).textTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            // --- DESCRIPTION ENDS HERE ---
            const SizedBox(height: ZSizes.spaceBtwItems),

            // ==========================================
            // ⭐️ DYNAMIC REVIEW SECTION ⭐️
            // ==========================================
            Text("Review", style: Theme.of(Get.context!).textTheme.titleLarge),
            const SizedBox(height: 4),

            Row(
              children: [
                // 2. USE THE NEW WIDGET!
                RatingBarIndicator(
                  rating: book.rating, // This connects directly to your database! (e.g. 4.5)
                  itemBuilder: (context, index) => const Icon(
                    Icons.star, // The package will automatically cut this icon in half!
                    color: Colors.amber,
                  ),
                  itemCount: 5, // Total max stars
                  itemSize: 20.0, // Size of each star
                  direction: Axis.horizontal,
                  unratedColor: ZColors.black, // Color for the empty part of the star
                ),

                const SizedBox(width: 8),

                // 3. The numerical text next to the stars
                Text(
                  "(${book.rating})", // Automatically prints "4.5"
                  style: Theme.of(Get.context!).textTheme.titleMedium!.apply(fontWeightDelta: 2),
                ),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            // ==========================================

            // --- QUANTITY ROW STARTS HERE ---
            Row(
              children: [
                // Minus Button
                Container(
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      if (quantity.value > 1) quantity.value--;
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                const SizedBox(width: 15),

                // Quantity Text (Wrapped in Obx to listen to changes instantly)
                Obx(() => Text('${quantity.value}', style: Theme.of(Get.context!).textTheme.titleLarge)),

                const SizedBox(width: 15),
                // Plus Button
                Container(
                  decoration: BoxDecoration(color: ZColors.primary500, borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      quantity.value++;
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),

                const Spacer(),

                // Dynamic Price
                Obx(
                  () => Text(
                    "Rs${(book.price * quantity.value).toStringAsFixed(2)}",
                    style: Theme.of(Get.context!).textTheme.headlineSmall!.apply(color: ZColors.primary500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            // 9. Call to Action Buttons
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.back();
                        cartController.addToCart(book, quantity.value);
                        Get.back(); // Closes the bottom sheet
                        NakhraSnakbars.successSnackBar(title: "Success", message: "${book.title} added to cart!");
                        // Get.snackbar("Success", "${book.title} added to cart!",
                        //     snackPosition: SnackPosition.TOP, backgroundColor: Colors.green.withOpacity(0.1));// Closes the bottom sheet
                        //         },
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: ZColors.primary500,
                        padding: EdgeInsets.all(10),
                      ),
                      child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Add items to Cart Controller here!
                        Get.back(); // Close sheet
                        bottomNavController.selectedIndex.value = 2;
                        // We will navigate to Cart later
                      },
                      child: const Text("View cart"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ZSizes.defaultSpace),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
