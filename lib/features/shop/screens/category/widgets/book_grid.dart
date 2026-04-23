import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nakhra/common/widgets/others/book_details_bottom_sheet.dart';
import 'package:nakhra/common/widgets/products/book_cards/bookc_card_vertical.dart';
import 'package:nakhra/features/shop/controllers/category_controller.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class BookGridView extends StatelessWidget {
  const BookGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    return Obx(() {
      if (controller.displayBooks.isEmpty) {
        return const Center(
          child: Text(ZTexts.noBooksFound, style: TextStyle(fontWeight: FontWeight.bold)),
        );
      }
      return GridView.builder(
        padding: EdgeInsets.only(top: 22, bottom: 20, left: 8, right: 5),
        itemCount: controller.displayBooks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final book = controller.displayBooks[index];
          return Material(
            child: InkWell(
              onTap: () {
                ZShowBookDetailsBottomSheet(book);
              },
              child: BookcCardVertical(book: book),
            ),
          );
        },
      );
    });
  }
}
