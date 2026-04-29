import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  // We store a list of BookModels directly for easy UI rendering
  RxList<BookModel> favorites = <BookModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoritesFromFirebase();
  }

  // Check if a book is currently favorited (used to color the heart icon!)
  bool isFavorite(String bookId) {
    return favorites.any((book) => book.id == bookId);
  }

  // Toggle the favorite status
  void toggleFavorite(BookModel book) {
    if (isFavorite(book.id)) {
      favorites.removeWhere((b) => b.id == book.id);
      // Get.snackbar("Removed", "Book removed from favorites", duration: const Duration(seconds: 1));
      NakhraSnakbars.successSnackBar(title: "Removed", message: "Book removed from favorites", duration: 1);
    } else {
      favorites.add(book);
      NakhraSnakbars.successSnackBar(title: "Added", message: "Book added to favorites", duration: 1);
      // Get.snackbar("Added", "Book added to favorites", duration: const Duration(seconds: 1));
    }
    saveFavoritesToFirebase();
  }

  // Save to Firebase
  Future<void> saveFavoritesToFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final jsonList = favorites.map((book) => book.toJson()).toList();

      await FirebaseFirestore.instance.collection('Favorites').doc(user.uid).set({'items': jsonList});
    } catch (e) {
      debugPrint("Error saving favorites: $e");
    }
  }

  // Load from Firebase
  Future<void> loadFavoritesFromFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final doc = await FirebaseFirestore.instance.collection('Favorites').doc(user.uid).get();
      if (doc.exists && doc.data() != null) {
        final List<dynamic> dataArray = doc.data()!['items'] ?? [];
        favorites.assignAll(
          dataArray.map((json) => BookModel.fromSnapshot(json as DocumentSnapshot<Map<String, dynamic>>)).toList(),
        );
        // Note: You might need a fromJson constructor in BookModel if fromSnapshot requires a DocumentSnapshot.
      }
    } catch (e) {
      debugPrint("Error loading favorites: $e");
      NakhraSnakbars.errorSnackBar(title: "Error", message: "Error loading favories the error is (${e})");
    }
  }
}
