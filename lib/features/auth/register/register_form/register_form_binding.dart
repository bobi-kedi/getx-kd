import 'package:get/get.dart';

import 'register_form_controller.dart';

class RegisterFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterFormController>(() => RegisterFormController());
  }
}
