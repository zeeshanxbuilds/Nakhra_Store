import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nakhra/features/shop/controllers/category_controller.dart';
import 'package:nakhra/utils/constants/colors.dart';

class CategorySelector extends StatelessWidget {
  CategorySelector({super.key});
  final List<String> categories = ['All', 'Self Help', 'Novels', 'Science', 'Romantic'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // physics: CustomBouncingScrollPhysics(),
      // padding: EdgeInsets.only(left: 5, right: 5),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Obx(() {
          final isSelected = controller.selectedCategory.value == category;
          return GestureDetector(
            onTap: () => controller.filterBooks(category),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    // curve: Curves.easeOut
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isSelected ? ZColors.black : ZColors.gray600,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                    child: Text(category),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: isSelected ? 3 : 0,
                    width: isSelected ? 10 : 0,
                    decoration: BoxDecoration(color: ZColors.primary500, borderRadius: BorderRadius.circular(2)),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
