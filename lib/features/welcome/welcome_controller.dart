import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';

class WelcomeController extends GetxController {
  void goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
