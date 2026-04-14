import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nakhra/home_screen_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

/// UI
class ZBottomNavigationBar extends StatelessWidget {
  ZBottomNavigationBar({super.key});
  final controller = Get.put(ZBottomNavigationController());

  void showExitDialog() {
    Get.defaultDialog(
      title: 'Exit App',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      middleText: "Are you sure you want to close the app?",
      backgroundColor: Colors.white,
      radius: 10,
      textCancel: "Cancel",
      cancelTextColor: ZColors.primary500,
      onCancel: () {},
      onConfirm: () {
        SystemNavigator.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (controller.selectedIndex.value != 0) {
          controller.selectedIndex.value = 0;
        } else {
          showExitDialog();
        }
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            elevation: 0,

            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(ZImages.homeIconGrey),
                selectedIcon: SvgPicture.asset(
                  ZImages.homeIconGrey,
                  colorFilter: ColorFilter.mode(ZColors.primary500, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(ZImages.categoryIconGrey),
                selectedIcon: SvgPicture.asset(
                  ZImages.categoryIconGrey,
                  colorFilter: ColorFilter.mode(ZColors.primary500, BlendMode.srcIn),
                ),
                label: 'Category',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(ZImages.cartIconGrey),
                selectedIcon: SvgPicture.asset(
                  ZImages.cartIconGrey,
                  colorFilter: ColorFilter.mode(ZColors.primary500, BlendMode.srcIn),
                ),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(ZImages.profileIconGrey),
                selectedIcon: SvgPicture.asset(
                  ZImages.profileIconGrey,
                  colorFilter: ColorFilter.mode(ZColors.primary500, BlendMode.srcIn),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: Obx(() => IndexedStack(index: controller.selectedIndex.value, children: controller.screens)),
        // body: controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}
