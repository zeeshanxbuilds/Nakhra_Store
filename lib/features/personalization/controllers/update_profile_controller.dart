import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';
import 'package:nakhra/features/personalization/controllers/user_controller.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';
import 'package:nakhra/utils/helpers/z_full_screen_loader.dart';

class UpdateProfileController extends GetxController {
  static UpdateProfileController get instance => Get.find();

  final userController = UserController.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final Rx<XFile?> selectedImage = Rx<XFile?>(null);
  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    nameController.text = userController.user.value.fullName;
    emailController.text = userController.user.value.email;
    phoneNumberController.text = userController.user.value.phoneNumber;
  }

  Future<void> pickProfileImage() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

      if (image != null) {
        selectedImage.value = image;
      }
    } catch (e) {
      NakhraSnakbars.errorSnackBar(title: 'Error', message: 'Failed to pick image');
    }
  }

  Future<String> uploadImageToCloudinary(XFile imageFile) async {
    const cloudName = 'dabaru8co';
    const uploadPreset = 'nakhra_unsigned';

    final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

    final request = http.MultipartRequest('Post', url);

    request.fields['upload_preset'] = uploadPreset;

    final multipartFile = await http.MultipartFile.fromPath('file', imageFile.path);
    request.files.add(multipartFile);

    final response = await request.send();

    final responseData = await response.stream.bytesToString();

    final jsonMap = json.decode(responseData);

    if (response.statusCode == 200) {
      return jsonMap['secure_url'];
    } else {
      throw 'Cloudinary Error : ${jsonMap['error']['message']}';
    }
  }

  // Future<void> updateProfile() async {
  //   try {
  //     if (nameController.text.trim() == userController.user.value.fullName &&
  //         emailController.text.trim() == userController.user.value.email &&
  //         phoneNumberController.text.trim() == userController.user.value.phoneNumber &&
  //         selectedImage.value == null) {
  //       Get.back();
  //       return;
  //     }

  //     ZFullScreenLoader.openLoadingDialog('Updating..');

  //     String finalImageUrl = userController.user.value.profilePicture;

  //     if (selectedImage.value != null) {
  //       finalImageUrl = await uploadImageToCloudinary(selectedImage.value!);
  //     }

  //     Map<String, dynamic> data = {
  //       'FullName': nameController.text.trim(),
  //       'Email': emailController.text.trim(),
  //       'PhoneNumber': phoneNumberController.text.trim(),
  //       'ProfilePicture': finalImageUrl,
  //     };

  //     final updateUserData = await UserRepository.instance.updatespecificFields(
  //       userController.user.value.uid,
  //       data,
  //     );

  //     userController.user.update((val) {
  //       val?.fullName = nameController.text.trim();
  //       // val?.email = emailController.text.trim();
  //       val?.phoneNumber = phoneNumberController.text.trim();
  //       val?.profilePicture = finalImageUrl;
  //     });

  //     ZFullScreenLoader.stopLoading();
  //     Get.back();
  //     NakhraSnakbars.successSnackBar(title: 'Success', message: 'Profile updated!');

  //     return;
  //   } catch (e) {
  //     ZFullScreenLoader.stopLoading();
  //     NakhraSnakbars.errorSnackBar(title: "Error", message: e.toString());
  //   }
  // }

  /// This is the new and updated updateproifle function
  Future<void> updateProfile() async {
    try {
      // 1. Check if anything actually changed
      if (nameController.text.trim() == userController.user.value.fullName &&
          phoneNumberController.text.trim() == userController.user.value.phoneNumber &&
          selectedImage.value == null) {
        Get.back();
        return;
      }

      ZFullScreenLoader.openLoadingDialog('Updating profile...');

      String finalImageUrl = userController.user.value.profilePicture;

      // 2. Upload to Cloudinary if a new image was selected
      if (selectedImage.value != null) {
        finalImageUrl = await uploadImageToCloudinary(selectedImage.value!);
      }

      // 3. 🚨 THE FIX: Prepare the JSON Map for Firebase (Make sure keys match your UserModel!)
      Map<String, dynamic> data = {
        'FullName': nameController.text.trim(),
        'PhoneNumber': phoneNumberController.text.trim(),
        'ProfilePicture': finalImageUrl,
      };

      // 4. 🚨 THE FIX: Actually send it to the Firebase Database!
      await UserRepository.instance.updatespecificFields(userController.user.value.uid, data);

      // 5. Update the local UI state so it changes instantly without reloading the app
      userController.user.update((val) {
        if (val != null) {
          val.fullName = nameController.text.trim();
          val.phoneNumber = phoneNumberController.text.trim();
          val.profilePicture = finalImageUrl;
        }
      });

      ZFullScreenLoader.stopLoading();
      Get.back();
      NakhraSnakbars.successSnackBar(title: 'Success', message: 'Profile updated successfully!');
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      NakhraSnakbars.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
