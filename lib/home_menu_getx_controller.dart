import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nakhra/features/shop/screens/cart/cart_screen.dart';
import 'package:nakhra/features/shop/screens/category/category_screen.dart';
import 'package:nakhra/features/shop/screens/home/home_screen.dart';
import 'package:nakhra/features/personalization/screens/profile/profile_screen.dart';

/// Controller
class ZBottomNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = const [HomeScreen(), CategoryScreen(), CartScreen(), ProfileScreen()];
}
