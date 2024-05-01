import 'package:get/get.dart';
import 'package:kelasdigital/features/auth/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
