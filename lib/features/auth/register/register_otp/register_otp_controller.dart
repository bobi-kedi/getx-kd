import 'package:get/get.dart';

class RegisterOtpController extends GetxController {
  var dataArg = Get.arguments;

  RxString selectedOtp = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedOtp.value = dataArg.toString();
    super.onInit();
  }
}
