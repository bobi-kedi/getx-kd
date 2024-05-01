import 'package:get/get.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';
import 'package:kelasdigital/features/conversation/conversation_controller.dart';
import 'package:kelasdigital/features/home/home_controller.dart';

import 'controller/connection_controller.dart';
import 'controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionController>(() => ConnectionController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConversationController>(() => ConversationController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
