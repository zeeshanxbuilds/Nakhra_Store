import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  RxList<BookModel> favorites = <BookModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoritesFromFirebase();
  }

  bool isFavorite(String bookId) {
    return favorites.any((book) => book.id == bookId);
  }

  void toggleFavorite(BookModel book) {
    if (isFavorite(book.id)) {
      favorites.removeWhere((b) => b.id == book.id);
      NakhraSnakbars.successSnackBar(title: "Removed", message: "Book removed from favorites", duration: 1);
    } else {
      favorites.add(book);
      NakhraSnakbars.successSnackBar(title: "Added", message: "Book added to favorites", duration: 1);
    }
    saveFavoritesToFirebase();
  }

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

  Future<void> loadFavoritesFromFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final doc = await FirebaseFirestore.instance.collection('Favorites').doc(user.uid).get();

      if (doc.exists && doc.data() != null) {
        final List<dynamic> dataArray = doc.data()!['items'] ?? [];

        // 🚨 THE CRASH FIX IS HERE: We use fromJson and cast to Map<String, dynamic>
        favorites.assignAll(dataArray.map((json) => BookModel.fromJson(json as Map<String, dynamic>)).toList());
      }
    } catch (e) {
      debugPrint("Error loading favorites: $e");
      NakhraSnakbars.errorSnackBar(title: "Error", message: "Error loading favorites: $e");
    }
  }
}
