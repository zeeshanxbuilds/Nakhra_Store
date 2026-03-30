import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: ZColors.primary500),
              const SizedBox(height: 20),
              Text(
                text,
                style: Theme.of(dialogContext).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: ZColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
