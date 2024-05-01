import 'package:get/get.dart';
import 'package:kelasdigital/features/onboard/onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
  }
}
