import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nakhra/common/widgets/others/z_cart_item_cards.dart';
import 'package:nakhra/features/shop/controllers/cart_controller.dart';
import 'package:nakhra/features/shop/screens/checkout/checkout_screen.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/text_strings.dart';
// TODO: Make sure your ZCartItemCard import is correct here!
// import 'package:nakhra/common/widgets/products/cart/z_cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
          child: Column(
            children: [
              // Your custom App Bar remains exactly the same!
              HomeAppbar(title: "My Cart", leading: null, action: () {}),

              Expanded(
                child: Obx(() {
                  // ==========================================
                  // STATE 1: EMPTY CART (Your original UI)
                  // ==========================================
                  if (cartController.cartItems.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ZImages.bigCartIcon),
                          const SizedBox(height: 30),
                          Text(
                            ZTexts.thereIsNoProduct,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    );
                  }

                  // ==========================================
                  // STATE 2: FILLED CART
                  // ==========================================
                  return ListView.separated(
                    padding: const EdgeInsets.all(10), // slight padding for aesthetic
                    itemCount: cartController.cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = cartController.cartItems[index];
                      // Use your ZCartItemCard widget here
                      return ZCartItemCard(
                        item: item,
                        onToggle: () => cartController.toggleItemSelection(item.bookId),
                        onAdd: () => cartController.updateQuantity(item.bookId, 1),
                        onRemove: () => cartController.updateQuantity(item.bookId, -1),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      // THE BOTTOM CHECKOUT BAR
      bottomNavigationBar: Obx(() {
        // We completely hide the bottom bar if the cart is empty
        if (cartController.cartItems.isEmpty) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 10, offset: const Offset(0, -5)),
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Price Column
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total", style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text(
                      "\$${cartController.totalSelectedPrice.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ZColors.primary500),
                    ),
                  ],
                ),

                // Checkout Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ZColors.primary500,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (cartController.totalSelectedPrice <= 0) {
                      Get.snackbar("Oops", "Please select an item to checkout.");
                      return;
                    }
                    Get.to(() => const CheckoutScreen());
                    // Get.snackbar("Success", "Proceeding to checkout!");
                  },
                  child: const Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
