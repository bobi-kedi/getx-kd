import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/features/main/controller/connection_controller.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';

class ChatController extends GetxController {
  var dataArg = Get.arguments;

  final ProfileController profileController = Get.find();
  RxBool isGroup = false.obs;
  RxBool isEmptyText = true.obs;

  late TextEditingController inputC;
  late FocusNode focusNode;

  RxBool isConnectedToNetwork = false.obs;
  late Widget showBar;

  @override
  void onInit() {
    isGroup.value = dataArg as bool;
    inputC = TextEditingController();
    focusNode = FocusNode(
      onKey: (FocusNode node, RawKeyEvent evt) {
        if (!evt.isShiftPressed && evt.logicalKey.keyLabel == 'Enter') {
          if (evt is RawKeyDownEvent) {
            sendMessage();
          }
          return KeyEventResult.handled;
        } else {
          return KeyEventResult.ignored;
        }
      },
    );

    showBar = ConnectionController.to.showBar();
    ConnectionController.to.showAlertConnection = false;
    isConnectedToNetwork = ConnectionController.to.isConnectedToNetwork;
    super.onInit();
  }

  void sendMessage() {
    String textMessage = inputC.text.trim();
    if (textMessage.isNotEmpty) {
      debugPrint('SEND MESSAGE : $textMessage');
      Future.delayed(Duration.zero, () {
        focusNode.requestFocus();
        isEmptyText.value = true;
        inputC.clear();
      });
    }
  }

  @override
  void onClose() {
    inputC.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
