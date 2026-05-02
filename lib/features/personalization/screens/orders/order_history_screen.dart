import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/controllers/order_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:intl/intl.dart'; // Used to format the date!

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller and fetch orders immediately
    final controller = Get.put(OrderController());
    controller.fetchUserOrders();

    return Scaffold(
      appBar: AppBar(title: const Text("Order History"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoadingOrders.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.userOrders.isEmpty) {
          return const Center(child: Text("You have no past orders."));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.userOrders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20), // Gap between different orders
          itemBuilder: (context, index) {
            final order = controller.userOrders[index];

            // Determine status color dynamically
            Color statusColor = Colors.orange; // Default for 'Processing'
            if (order.status.toLowerCase() == 'delivered') statusColor = Colors.green;
            if (order.status.toLowerCase() == 'shipped') statusColor = Colors.blue;

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ZColors.gray400),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- HEADER: Status and Date ---
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.id,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          order.status,
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),

                  // --- BODY: The Stacked Books (No Gaps!) ---
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), // Disables scrolling inside the card
                    itemCount: order.items.length,
                    itemBuilder: (context, itemIndex) {
                      final item = order.items[itemIndex];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            // Book Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: item.coverImageUrl,
                                width: 50,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Book Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: Theme.of(context).textTheme.titleMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text("Qty: ${item.quantity}", style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                            // Price
                            Text(
                              "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                              style: const TextStyle(fontWeight: FontWeight.bold, color: ZColors.primary500),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1, thickness: 1),
                  // --- FOOTER: Total Price ---
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy').format(order.orderDate),
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "Total: \$${order.totalAmount.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
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
