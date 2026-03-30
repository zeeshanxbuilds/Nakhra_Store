import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// update Current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// update current index and jump to the last page
  void skipPage() {
    Get.to(LoginScreen());
    // currentPageIndex.value = 2;
    // pageController.jumpToPage(2);
  }
}
