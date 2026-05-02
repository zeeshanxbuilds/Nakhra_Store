import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/controllers/cart_controller.dart';
import 'package:nakhra/features/shop/controllers/order_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controllers
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. ORDER SUMMARY ---
            Text('Order Summary', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: ZSizes.spaceBtwItems),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ZColors.gray400),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal', style: TextStyle(fontSize: 16)),
                      Text(
                        '\$${cartController.totalSelectedPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Shipping Fee', style: TextStyle(fontSize: 16)),
                      const Text(
                        '\$5.00',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ), // Flat $5 shipping for now
                    ],
                  ),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        '\$${(cartController.totalSelectedPrice + 5.0).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ZColors.primary500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            // --- 2. PAYMENT METHOD ---
            Text('Payment Method', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: ZSizes.spaceBtwItems),

            Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: orderController.selectedPaymentMethod.value == 'Cash on Delivery'
                        ? ZColors.primary500
                        : ZColors.gray400,
                  ),
                ),
                child: RadioListTile(
                  value: 'Cash on Delivery',
                  groupValue: orderController.selectedPaymentMethod.value,
                  onChanged: (value) => orderController.selectedPaymentMethod.value = value.toString(),
                  title: const Text('Cash on Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Pay when you receive the package.'),
                  activeColor: ZColors.primary500,
                  secondary: const Icon(Icons.local_shipping, color: ZColors.primary500, size: 30),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // The "Coming Soon" Sandbox Option
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: orderController.selectedPaymentMethod.value == 'Credit Card'
                        ? ZColors.primary500
                        : ZColors.gray400,
                  ),
                ),
                child: RadioListTile(
                  value: 'Credit Card',
                  groupValue: orderController.selectedPaymentMethod.value,
                  onChanged: (value) {
                    orderController.selectedPaymentMethod.value = value.toString();
                    // Note: We will add the Stripe/Sandbox UI to this option later!
                  },
                  title: const Text('Credit Card / Debit Card', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Powered by Stripe (Sandbox)'),
                  activeColor: ZColors.primary500,
                  secondary: const Icon(Icons.credit_card, color: Colors.blueAccent, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),

      // --- 3. PLACE ORDER BUTTON ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: SafeArea(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ZColors.primary500,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () => orderController.processOrder(),
            child: const Text(
              "Place Order",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
