import 'package:get/get.dart';

import 'register_role_controller.dart';

class RegisterRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRoleController>(() => RegisterRoleController());
  }
}
