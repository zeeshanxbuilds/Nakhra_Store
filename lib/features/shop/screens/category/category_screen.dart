import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nakhra/features/shop/controllers/category_controller.dart';
import 'package:nakhra/features/shop/screens/category/widgets/book_grid.dart';
import 'package:nakhra/features/shop/screens/category/widgets/category_selector.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 2),
          child: Column(
            children: [
              HomeAppbar(title: ZTexts.categoryAppBarTitle, leading: () {}, action: () {}),
              SizedBox(height: 22),
              SizedBox(height: 35, child: CategorySelector()),

              Expanded(child: BookGridView()),
              // Column(children: [CategoryScreen()]),
            ],
          ),
        ),
      ),
    );
  }
}
