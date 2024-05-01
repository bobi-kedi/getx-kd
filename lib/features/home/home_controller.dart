import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';

class HomeController extends GetxController {
  final ProfileController profileC = Get.find();

  void logout() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    });
  }

  void goToProfile() async {
    Get.toNamed(Routes.PROFILE);
  }
}
