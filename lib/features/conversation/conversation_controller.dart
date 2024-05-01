import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/routes/app_pages.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';

class ConversationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ProfileController profileController = Get.find();
  RxString title = 'Conversation Title'.obs;
  late TabController tabController;

  RxInt tabIndex = 0.obs;

  RxList dataConversation = [].obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);

    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });

    getConversation();
    super.onInit();
  }

  void goToChat({bool isGroup = false}) {
    Get.toNamed(Routes.CHAT, arguments: isGroup);
  }

  void goToProfile() async {
    Get.toNamed(Routes.PROFILE);
  }

  getConversation() {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.dispose();
  }
}
