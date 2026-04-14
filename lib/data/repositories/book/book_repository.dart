import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/models/book_model.dart';

class BookRepository extends GetxController {
  static BookRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BookModel>> getFeaturedBooks() async {
    try {
      final snapshot = await _db.collection('Books').where('isFeatured', isEqualTo: true).limit(5).get();
      return snapshot.docs.map((document) => BookModel.fromSnapshot(document)).toList();
    } on FirebaseException catch (e) {
      throw 'Firebase Error : ${e.message}';
    } catch (e) {
      throw "Something went wrong while fetching featured books. Please try again";
    }
  }

  Future<List<BookModel>> getBooksByCategory({required String categoryId}) async {
    try {
      final snapshot = await _db.collection('Books').where('categoryId', isEqualTo: categoryId).get();
      return snapshot.docs.map((e) => BookModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw "Something went wrong fetching category books.";
    }
  }
}
