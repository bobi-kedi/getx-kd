import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/helpers/services/local/cache_service.dart';

class OnboardController extends GetxController {
  goToWelcome() {
    CacheService.to.onboardState = true;
    Get.offAllNamed(Routes.WELCOME);
  }
}
