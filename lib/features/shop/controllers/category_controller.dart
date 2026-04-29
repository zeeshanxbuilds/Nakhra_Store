import 'package:get/get.dart';
import 'package:nakhra/data/repositories/book/book_repository.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final RxList<BookModel> allBooks = <BookModel>[].obs;

  final RxList<BookModel> displayBooks = <BookModel>[].obs;

  final RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllBooksFromFirebase();
  }

  Future<void> fetchAllBooksFromFirebase() async {
    try {
      isLoading.value = true;

      final books = await BookRepository.instance.getAllBooks();
      allBooks.assignAll(books);
      filterBooks('All');
    } catch (e) {
      NakhraSnakbars.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // void loadDummyData() {
  //   allBooks.assignAll(DummyData.books);
  //   filterBooks('All');
  // }

  void filterBooks(String categoryId) {
    selectedCategory.value = categoryId;
    if (categoryId == 'All') {
      displayBooks.assignAll(allBooks);
    } else {
      final filteredList = allBooks.where((book) => book.categoryId == categoryId).toList();
      displayBooks.assignAll(filteredList);
    }
  }
}
