import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';
import 'package:nakhra/features/personalization/models/user_model.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;

  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        final userModel = await userRepository.fetchUserDetails(currentUser.uid);

        user(userModel);
      }
    } catch (e) {
      user(UserModel.empty());
      NakhraSnakbars.errorSnackBar(title: 'Data Error', message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }
}
