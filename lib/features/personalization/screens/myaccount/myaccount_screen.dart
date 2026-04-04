import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My account', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23)),
        centerTitle: true,
        leadingWidth: 44,
        leading: IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset(ZImages.backArrow)),
      ),

      body: Center(child: Text('My Account')),
    );
  }
}
