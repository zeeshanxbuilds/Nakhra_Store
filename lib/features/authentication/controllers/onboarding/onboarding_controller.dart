import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) {}

  /// jump to the specific dot selected page
  void dotNavigationClick(index) {}

  /// update Current index and jump to next page
  void nextPage() {}

  /// update current index and jump to the last page
  void skipPage() {}
}
