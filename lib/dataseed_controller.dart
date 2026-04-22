import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nakhra/dummy_data_authors.dart';
import 'package:nakhra/dummy_data_books.dart';
import 'package:nakhra/dummy_data_vendors.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class DataSeederController extends GetxController {
  // This is the function you will call when you press the button!
  Future<void> uploadAllDummyData() async {
    try {
      // 1. Get the Firestore instance and create a Batch
      final db = FirebaseFirestore.instance;
      final batch = db.batch();

      // 2. Loop through AUTHORS and add to batch
      for (var author in DummyDataAuthors.authors) {
        // We use .doc(author['id']) so we force Firebase to use OUR custom ID ('author1')
        // instead of generating a random gibberish ID.
        final docRef = db.collection('Authors').doc(author['id']);
        batch.set(docRef, author);
      }

      // 3. Loop through VENDORS and add to batch
      for (var vendor in DummyDataVendors.vendors) {
        final docRef = db.collection('Vendors').doc(vendor['id']);
        batch.set(docRef, vendor);
      }

      // 4. Loop through BOOKS and add to batch
      for (var book in DummyDataBooks.books) {
        // For books, we DO want Firebase to generate a random ID, so we leave .doc() empty.
        final docRef = db.collection('Books').doc();
        batch.set(docRef, book);
      }
      log("this is my message");
      debugPrint("abd");
      NakhraSnakbars.successSnackBar(title: 'Data', message: "Data is sending to internet");
      await batch.commit();

      NakhraSnakbars.successSnackBar(title: "Success", message: "Your data has been send successfully");
    } catch (e) {
      log("uploadAllDummyData failed", name: "DataSeederController", error: e);
      NakhraSnakbars.errorSnackBar(title: 'oops', message: "Your data isnt sent to firebase dont know the issue");
    }
  }
}
