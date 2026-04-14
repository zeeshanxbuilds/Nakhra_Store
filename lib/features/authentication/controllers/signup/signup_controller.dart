import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';
import 'package:nakhra/features/personalization/models/user_model.dart';
import 'package:nakhra/home_screen.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';
import 'package:nakhra/utils/helpers/z_full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;

  final fullName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Future<void> signup() async {
    try {
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      ZFullScreenLoader.openLoadingDialog('We are processing you information....');
      // NakhraSnakbars.successSnackBar(title: 'Processing', message: 'Creating your account');
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      final newUser = UserModel(
        uid: userCredential.user!.uid,
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        createdAt: userCredential.user!.metadata.creationTime ?? DateTime.now(),
      );
      await UserRepository.instance.saveUserRecord(newUser);

      ZFullScreenLoader.stopLoading();

      NakhraSnakbars.successSnackBar(title: 'Congratulations!', message: 'Your account has been created.');
      await Future.delayed(Duration(seconds: 2));
      Get.offAll(() => ZBottomNavigationBar());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: 'Registration Failed', message: e.toString());
    }
  }

  @override
  void onClose() {
    fullName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.onClose();
  }
}
