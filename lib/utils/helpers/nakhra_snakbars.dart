import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/utils/constants/colors.dart';

class NakhraSnakbars {
  static void successSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,

      isDismissible: true,
      shouldIconPulse: true,
      colorText: ZColors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check_circle, color: ZColors.white),
    );
  }

  // ignore: strict_top_level_inference
  static errorSnackBar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: ZColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.error_outline, color: Colors.white),
    );
  }
}
