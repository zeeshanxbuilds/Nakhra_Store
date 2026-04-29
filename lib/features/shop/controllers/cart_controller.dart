import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/features/shop/models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // 1. LIVE STATE
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartFromFirebase();
  }

  // 2. ADD TO CART
  void addToCart(BookModel book, int quantity) {
    if (quantity < 1) return;

    final existingItemIndex = cartItems.indexWhere((item) => item.bookId == book.id);

    if (existingItemIndex >= 0) {
      // Update existing item
      cartItems[existingItemIndex].quantity += quantity;
      cartItems.refresh();
    } else {
      // Add new item (Notice we default isSelected to true!)
      final newItem = CartItemModel(
        bookId: book.id,
        title: book.title,
        price: book.price,
        coverImageUrl: book.coverImageUrl,
        vendorName: book.vendorName,
        quantity: quantity,
        isSelected: true, // Fixed the bug here!
      );
      cartItems.add(newItem);
    }

    saveCartToFirebase();
  }

  // 3. SAVE TO FIREBASE (Top-Level Collection Architecture)
  Future<void> saveCartToFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final cartJsonList = cartItems.map((item) => item.toJson()).toList();

      // Flat is fast! Saving to Carts/{uid}
      await FirebaseFirestore.instance.collection('Carts').doc(user.uid).set({'items': cartJsonList});
    } catch (e) {
      debugPrint("Error saving cart: $e");
    }
  }

  // 4. LOAD FROM FIREBASE
  Future<void> loadCartFromFirebase() async {
    try {
      isLoading.value = true;
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docSnapshot = await FirebaseFirestore.instance.collection('Carts').doc(user.uid).get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final List<dynamic> dataArray = docSnapshot.data()!['items'] ?? [];
        cartItems.assignAll(
          dataArray.map((json) => CartItemModel.fromJson(json as Map<String, dynamic>)).toList(),
        );
      }
    } catch (e) {
      debugPrint("Error loading cart: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 5. HELPER FUNCTIONS
  double get totalSelectedPrice {
    return cartItems
        .where((item) => item.isSelected)
        .fold(0.0, (previousValue, item) => previousValue + (item.price * item.quantity));
  }

  void toggleItemSelection(String bookId) {
    final index = cartItems.indexWhere((item) => item.bookId == bookId);
    if (index >= 0) {
      cartItems[index].isSelected = !cartItems[index].isSelected;
      cartItems.refresh();
      saveCartToFirebase();
    }
  }

  void updateQuantity(String bookId, int change) {
    final index = cartItems.indexWhere((item) => item.bookId == bookId);
    if (index >= 0) {
      cartItems[index].quantity += change;
      if (cartItems[index].quantity <= 0) {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
      saveCartToFirebase();
    }
  }
}
