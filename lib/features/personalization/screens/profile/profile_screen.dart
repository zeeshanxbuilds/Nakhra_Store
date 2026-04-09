import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nakhra/common/widgets/list_tiles/profile_menu_tile.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/features/authentication/screens/login/login.dart';
import 'package:nakhra/features/personalization/controllers/user_controller.dart';
import 'package:nakhra/features/personalization/screens/myaccount/myaccount_screen.dart';
import 'package:nakhra/features/personalization/screens/profile/widgets/user_profile_header.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/text_strings.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ZTexts.zProfile, style: Theme.of(context).textTheme.headlineMedium!.copyWith()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Divider(thickness: 0.5, color: ZColors.gray400),
              Obx(() {
                if (controller.profileLoading.value) {
                  return const Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator());
                }
                return ZUserProfileHeader(
                  userProfileName: controller.user.value.fullName,
                  userProfileemail: controller.user.value.email,
                  userProfileImage: controller.user.value.profilePicture,
                  trailingOnTap: () async {
                    try {
                      await AuthenticationRepository.instance.logout();

                      Get.offAll(LoginScreen());
                    } catch (e) {
                      NakhraSnakbars.errorSnackBar(title: 'Error', message: e.toString());
                    }
                  },
                );
              }),
              Divider(thickness: 0.5, color: ZColors.gray400),
              SizedBox(height: 16),
              ZProfileMenuTile(
                leading: SvgPicture.asset(ZImages.myAccountIcon),
                title: "My Account",
                trailing: SvgPicture.asset(
                  ZImages.cheveronTrailingIcon,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(ZColors.gray500, BlendMode.srcIn),
                ),
                ontap: () {
                  Get.to(() => MyAccountScreen());
                },
              ),
              SizedBox(height: 12),
              ZProfileMenuTile(leading: SvgPicture.asset(ZImages.addressIcon), title: "Address", ontap: () {}),
              // ZProfileMenuTile(title: "My Account"),
              SizedBox(height: 12),
              ZProfileMenuTile(
                leading: SvgPicture.asset(ZImages.offersAndPromosIcon),
                title: "Offers & Promos",
                ontap: () {},
              ),
              SizedBox(height: 12),
              ZProfileMenuTile(
                leading: SvgPicture.asset(ZImages.yourFavoritesIcon),
                title: "Your Favorites",
                ontap: () {},
              ),
              SizedBox(height: 12),
              ZProfileMenuTile(
                leading: SvgPicture.asset(ZImages.orderHistoryIcon),
                title: "Order History",
                ontap: () {},
              ),
              SizedBox(height: 12),
              ZProfileMenuTile(
                leading: SvgPicture.asset(ZImages.helpCenterIcon),
                title: "Help Center",
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
