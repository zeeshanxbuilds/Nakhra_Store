import 'package:get/get.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/constants/dummy_data.dart';

class CategoryController extends GetxController {
  final RxList<BookModel> allBooks = <BookModel>[].obs;

  final RxList<BookModel> displayBooks = <BookModel>[].obs;

  final RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    allBooks.assignAll(DummyData.books);
    filterBooks('All');
  }

  void filterBooks(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      displayBooks.assignAll(allBooks);
    } else {
      final filteredList = allBooks.where((book) => book.category == category).toList();
      displayBooks.assignAll(filteredList);
    }
  }
}
