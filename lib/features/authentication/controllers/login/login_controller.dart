import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/home_menu_getx.dart';
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

  Future<void> emailAndPasswordSignIn() async {
    try {
      /// yay form ki validation ko check kar raha hy ( checking the validation of the form )
      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      ZFullScreenLoader.openLoadingDialog('Loading...');

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.successSnackBar(title: 'Welcome Back!', message: 'You are now logged in');

      Get.offAll(ZBottomNavigationBar());
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: 'Error', message: e.toString(), duration: 10);
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
