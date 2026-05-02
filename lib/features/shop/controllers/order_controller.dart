import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/controllers/cart_controller.dart';
import 'package:nakhra/features/shop/models/order_model.dart';
import 'package:nakhra/home_screen.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';
import 'package:nakhra/utils/helpers/z_full_screen_loader.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;

  RxList<OrderModel> userOrders = <OrderModel>[].obs;
  RxBool isLoadingOrders = false.obs;

  // By default, we select COD. Later we can add 'Credit Card' or 'JazzCash'
  RxString selectedPaymentMethod = 'Cash on Delivery'.obs;

  Future<void> fetchUserOrders() async {
    try {
      isLoadingOrders.value = true;
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Fetch all orders for this specific user
      final snapshot = await FirebaseFirestore.instance
          .collection('Orders')
          .where('userId', isEqualTo: user.uid)
          .get();

      // Convert Firebase data to Dart Objects
      final orders = snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();

      // Sort them so the newest order is at the top!
      orders.sort((a, b) => b.orderDate.compareTo(a.orderDate));

      userOrders.assignAll(orders);
    } catch (e) {
      debugPrint("Error fetching orders: $e");
    } finally {
      isLoadingOrders.value = false;
    }
  }

  Future<void> processOrder() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        NakhraSnakbars.errorSnackBar(title: 'Error', message: 'You must be logged in to place an order.');
        return;
      }

      // 1. Start Loading Animation
      ZFullScreenLoader.openLoadingDialog('Processing your order...');

      // 2. Generate a unique Order ID (e.g., ORD-16987654321)
      final String orderId = 'ORD-${DateTime.now().millisecondsSinceEpoch}';

      // 3. Create the Order Blueprint
      // We filter the cart to ONLY include items the user checked!
      final selectedItems = cartController.cartItems.where((item) => item.isSelected).toList();

      final order = OrderModel(
        id: orderId,
        userId: user.uid,
        totalAmount: cartController.totalSelectedPrice,
        paymentMethod: selectedPaymentMethod.value,
        status: 'Processing', // It starts as Processing!
        orderDate: DateTime.now(),
        items: selectedItems,
      );

      // 4. Save to Firebase in a Global 'Orders' Collection (Best for Admins!)
      await FirebaseFirestore.instance.collection('Orders').doc(orderId).set(order.toJson());

      // 5. Clear ONLY the selected items from the Cart locally & in Firebase
      cartController.cartItems.removeWhere((item) => item.isSelected);
      await cartController.saveCartToFirebase();

      // 6. Stop Loading & Show Success
      ZFullScreenLoader.stopLoading();

      // Go back to the Home Screen and show a success message!
      Get.offAll(() => ZBottomNavigationBar());
      NakhraSnakbars.successSnackBar(
        title: 'Order Placed!',
        message: 'Your order $orderId has been placed successfully.',
      );
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: 'Order Failed', message: e.toString());
    }
  }
}
