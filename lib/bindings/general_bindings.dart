import 'package:get/get.dart';
import 'package:nakhra/data/repositories/authentication/authentication_repository.dart';
import 'package:nakhra/data/repositories/book/book_repository.dart';
import 'package:nakhra/data/repositories/user/user_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository(), permanent: true);
    Get.put(UserRepository(), permanent: true);
    Get.lazyPut(() => BookRepository(), fenix: true);
  }
}
