import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

class DetailProfileController extends GetxController {
  final ProfileController profileController = Get.find();

  late TextEditingController usernameC;
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;

  RxString version = ''.obs;

  @override
  void onInit() {
    super.onInit();

    usernameC = TextEditingController(
        text: profileController.currentUser?.username ?? '');
    nameC = TextEditingController(
        text: profileController.currentUser?.fullname ?? '');
    emailC =
        TextEditingController(text: profileController.currentUser?.email ?? '');

    manipulatePhone();

    version.value = CacheService.to.appVersion;
  }

  void manipulatePhone() {
    String phone = '';

    if (profileController.currentUser?.phone != null) {
      phone = profileController.currentUser!.phone!.substring(3);
    }

    phoneC = TextEditingController(text: phone);
    debugPrint('PHONE DETAIL $phone');
  }

  void goToBankAccount() {
    Get.toNamed(Routes.BANK_ACCOUNT);
  }

  void goToEditProfile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  @override
  void onClose() {
    super.onClose();

    usernameC.dispose();
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
  }
}
