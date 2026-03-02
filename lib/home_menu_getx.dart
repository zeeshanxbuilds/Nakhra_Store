import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/screens/cart/cart_screen.dart';
import 'package:nakhra/features/shop/screens/category/category_screen.dart';
import 'package:nakhra/features/shop/screens/home/home_screen.dart';
import 'package:nakhra/features/personalization/screens/profile/profile_screen.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

/// Controller
class ZBottomNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = const [HomeScreen(), CategoryScreen(), CartScreen(), ProfileScreen()];
}

/// UI
class ZBottomNavigationBar extends StatelessWidget {
  ZBottomNavigationBar({super.key});
  final controller = Get.put(ZBottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
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
    );
  }
}
