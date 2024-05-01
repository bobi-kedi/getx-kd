import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';

class RegisterRoleController extends GetxController {
  var dataArg = Get.arguments;

  void goToRegisterForm({required String role}) {
    var data = {'type': dataArg.toString(), 'role': role};

    Get.toNamed(Routes.REGISTER_FORM, arguments: data);
  }
}
