import 'package:get/get.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/data/repositories/book/book_repository.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
    Get.put(UserRepository());
    Get.lazyPut(() => BookRepository());
  }
}
