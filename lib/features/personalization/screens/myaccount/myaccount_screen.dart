import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nakhra/common/widgets/login_signup/z_elevated_button.dart';
import 'package:nakhra/common/widgets/login_signup/z_text_field.dart';
import 'package:nakhra/features/personalization/controllers/update_profile_controller.dart';
import 'package:nakhra/features/personalization/controllers/user_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text('My account', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23)),
        centerTitle: true,
        leadingWidth: 44,
        leading: IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset(ZImages.backArrow)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 225,
              child: Stack(
                alignment: AlignmentGeometry.topCenter,
                children: [
                  Container(height: 100, width: double.infinity, color: ZColors.grey10),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        Obx(() {
                          final networkImage = UserController.instance.user.value.profilePicture;
                          final localImage = controller.selectedImage.value;
                          ImageProvider imageProvider;
                          if (localImage != null) {
                            imageProvider = FileImage(File(localImage.path));
                          } else if (networkImage.isNotEmpty) {
                            imageProvider = NetworkImage(networkImage);
                          } else {
                            imageProvider = const AssetImage(ZImages.profileIcon);
                          }

                          return CircleAvatar(radius: 60, backgroundImage: imageProvider);
                        }),

                        const SizedBox(height: ZSizes.defaultSpace),
                        TextButton(
                          onPressed: () => controller.pickProfileImage(),
                          style: TextButton.styleFrom(),
                          child: Text(
                            ZTexts.changePicture,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ZColors.primary500,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ZTextFormField(label: 'Name', hintText: 'Your Name', controller: controller.nameController),
                    SizedBox(height: ZSizes.defaultSpace),

                    // ZTextFormField(label: 'Email', hintText: 'Your Email', controller: controller.emailController),
                    // SizedBox(height: ZSizes.defaultSpace),
                    ZTextFormField(
                      label: 'Phone Number',
                      hintText: 'Enter your phone number',
                      controller: controller.phoneNumberController,
                    ),

                    SizedBox(height: 80),

                    SizedBox(
                      width: double.infinity,
                      child: ZElevatedButton(
                        child: const Text(ZTexts.saveChanges),
                        onPressed: () => controller.updateProfile(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
