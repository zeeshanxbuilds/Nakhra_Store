import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';
import 'package:nakhra/features/personalization/models/user_model.dart';
import 'package:nakhra/home_screen.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';
import 'package:nakhra/utils/helpers/z_full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  // final formKey = GlobalKey<FormState>();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Email and password Login
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// yay form ki validation ko check kar raha hy ( checking the validation of the form )
      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      ZFullScreenLoader.openLoadingDialog('Loading...');

      // final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(
      //   email.text.trim(),
      //   password.text.trim(),
      // );

      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.successSnackBar(title: 'Welcome Back!', message: 'Enjoy the books 😊');
      await Future.delayed(Duration(seconds: 3));
      email.clear();
      password.clear();
      Get.offAll(ZBottomNavigationBar());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: 'Error', message: e.toString(), duration: 10);
    }
  }

  /// Google Sign In

  Future<void> googleSignIn() async {
    try {
      /// this is my custom screen loader gonna add the custom loader json animation later
      ///  (if i still didnt add the json animation of loader just remind me on my socials 😀)
      ZFullScreenLoader.openLoadingDialog('');

      /// this checkes the internet connection before pinging firebase if the connection is not good it stops the
      /// loading screen and shows an error snackbar
      final isconnected = await InternetConnection().hasInternetAccess;
      if (!isconnected) {
        ZFullScreenLoader.stopLoading();
        NakhraSnakbars.errorSnackBar(title: 'Internet', message: 'Bad Internet (normal In Pakistan 😂)');
        return;
      }

      final UserCredential? userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      if (userCredential == null) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        String rawName = userCredential.user!.displayName ?? '';
        String userEmail = userCredential.user!.email ?? '';

        String finalName = rawName.isNotEmpty ? rawName : userEmail.split('@').first;

        final newUser = UserModel(
          uid: userCredential.user!.uid,
          fullName: finalName,
          email: userEmail,
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
          createdAt: userCredential.user!.metadata.creationTime ?? DateTime.now(),
        );
        await UserRepository.instance.saveUserRecord(newUser);
      }
      ZFullScreenLoader.stopLoading();

      if (userCredential.additionalUserInfo?.isNewUser == true) {
        NakhraSnakbars.successSnackBar(title: 'WELCOME!', message: "We're glad you're here.");
      } else {
        NakhraSnakbars.successSnackBar(
          title: 'Good to see you again!',
          message: 'Ready to dive back into your current chapter?',
          duration: 3,
        );
      }

      await Future.delayed(Duration(milliseconds: 1500));
      email.clear();
      password.clear();
      // email.dispose();
      // password.dispose();
      Get.offAll(() => ZBottomNavigationBar());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
