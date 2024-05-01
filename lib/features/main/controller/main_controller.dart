import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'connection_controller.dart';

class MainController extends GetxController {
  late PersistentTabController bottomController;

  RxBool isConnectedToNetwork = false.obs;
  late Widget showBar;

  @override
  void onInit() {
    bottomController = PersistentTabController(initialIndex: 0);
    showBar = ConnectionController.to.showBar();
    ConnectionController.to.showAlertConnection = true;
    isConnectedToNetwork = ConnectionController.to.isConnectedToNetwork;

    init();

    super.onInit();
  }

  init() async {
    await Future.delayed(const Duration(milliseconds: 200));
    ProfileController.to.onInit();

    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    bottomController.dispose();
  }
}
