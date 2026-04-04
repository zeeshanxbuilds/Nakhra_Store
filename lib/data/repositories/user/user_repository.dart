import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/personalization/models/user_model.dart';
import 'package:nakhra/utils/exceptions/zplatform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.uid).set(user.tojson());
    } catch (e) {
      throw 'Something went wrong while saving your information. Please try again. ';
      // print(e.toString());
    }
  }

  Future<UserModel> fetchUserDetails(String uid) async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(uid).get();

      return UserModel.fromSnapshot(documentSnapshot);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something went wrong with Firebase';
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching user details. Please try again.';
    }
  }
}
