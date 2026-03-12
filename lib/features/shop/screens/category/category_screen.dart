import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/utils/constants/text_strings.dart';
import 'package:nakhra/utils/helpers/custom_scroll_physics.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppbar(title: ZTexts.categoryAppBarTitle),
            SingleChildScrollView(physics: CustomBouncingScrollPhysics()),
            Column(children: []),
          ],
        ),
      ),
    );
  }
}
