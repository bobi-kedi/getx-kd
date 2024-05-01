import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';

class RegisterVerifyController extends GetxController {
  var dataArg = Get.arguments;

  RxInt selectedIndex = 1.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    email.value = dataArg['email'];
    phone.value = dataArg['phone'];
    super.onInit();
  }

  void goToRegisterOtp() {
    String selectedOtp = '';
    if (selectedIndex.value == 1) {
      selectedOtp = 'Email ${email.value}';
    } else {
      selectedOtp = 'SMS ${phone.value}';
    }
    Get.offNamedUntil(Routes.REGISTER_OTP, (route) => false,
        arguments: selectedOtp);
  }
}
