import 'package:get/get.dart';

import 'register_otp_controller.dart';

class RegisterOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpController>(() => RegisterOtpController());
  }
}
