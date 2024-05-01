import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';

class RegisterController extends GetxController {
  void navigationNext({required String argument}) {
    if (argument.toLowerCase() == 'institute') {
      debugPrint('Institute');
      Get.toNamed(Routes.REGISTER_ROLE, arguments: argument);
    } else {
      var data = {'type': argument, 'role': argument};
      debugPrint('GENERAL');
      Get.toNamed(Routes.REGISTER_FORM, arguments: data);
    }
  }
}
