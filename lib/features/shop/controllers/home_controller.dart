import 'package:get/get.dart';

class HomeController extends GetxController {
  final crouselCurrentIndex = 0.obs;
  void updatePageIndicator(int index) {
    crouselCurrentIndex.value = index;
  }
}
