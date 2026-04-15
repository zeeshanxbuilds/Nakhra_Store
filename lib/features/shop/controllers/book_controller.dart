import 'package:get/get.dart';
import 'package:nakhra/data/repositories/book/book_repository.dart';
import 'package:nakhra/features/shop/models/book_model.dart';
import 'package:nakhra/utils/helpers/nakhra_snakbars.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<BookModel> featuredBooks = <BookModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedBooks();
    super.onInit();
  }

  Future<void> fetchFeaturedBooks() async {
    try {
      isLoading.value = true;
      final books = await BookRepository.instance.getFeaturedBooks();
      featuredBooks.assignAll(books);
    } catch (e) {
      NakhraSnakbars.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
