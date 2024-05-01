import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';
import 'widget/footer_chat.dart';
import 'widget/header_chat_group.dart';
import 'widget/header_chat_private.dart';
import 'widget/kd_message/kd_message.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Obx(
              () => !controller.isConnectedToNetwork.value
                  ? controller.showBar
                  : Container(),
            ),
            Obx(
              () => (controller.isGroup.value)
                  ? const HeaderChatGroup(
                      title: 'Pendidikan Pancasila',
                      description: '300 Members, 12 Online',
                    )
                  : const HeaderChatPrivate(
                      isFriend: true,
                    ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                reverse: true,
                children: const [
                  KdFileMessage(
                    message: 'File Message here',
                    messageAt: '08:59',
                  ),
                  KdFileMessage(
                    message: 'File Message here',
                    messageAt: '08:59',
                    isMe: true,
                  ),
                  KdImageMessage(
                    message: 'Image Message here',
                    messageAt: '08:59',
                    isMe: true,
                  ),
                  KdImageMessage(
                    message: 'Image Message here',
                    messageAt: '08:59',
                  ),
                  KdCustomMessage(
                    message: 'Custom Message here',
                    messageAt: '08:59',
                  ),
                  KdCustomMessage(
                    message: 'Custom Message here',
                    messageAt: '08:59',
                    isMe: true,
                  ),
                  KdTextMessage(
                    message:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis aliquet mi. Maecenas id tortor sodales, vehicula nisi non, molestie nisi. Maecenas lobortis justo et mi scelerisque interdum.',
                    messageAt: '09:10',
                    isMe: true,
                  ),
                  KdTextMessage(
                    message:
                        'Nulla est ex, tempor nec erat quis, consequat finibus',
                    messageAt: '09:05',
                  ),
                  KdTextMessage(
                    message:
                        'Nulla est ex, tempor nec erat quis, consequat finibus\n\n\nDonec laoreet semper dolor, ac mollis arcu dapibus in. Maecenas tristique semper ligula, nec scelerisque sapien faucibus',
                    messageAt: '09:00',
                  ),
                  KdTextMessage(
                    message: 'Kelas Digital',
                    messageAt: '08:59',
                    isMe: true,
                  ),
                  KdSystemMessage(
                    isSession: true,
                  ),
                  KdSystemMessage(),
                ],
              ),
            ),
            Obx(
              () => FooterChat(
                controller: controller.inputC,
                isEmptyText: (controller.isEmptyText.value),
                focusNode: controller.focusNode,
                onChanged: (value) {
                  controller.isEmptyText.value = (value.isEmpty);
                },
                onSendTapped: () {
                  if (controller.inputC.text.trim().isNotEmpty) {
                    controller.sendMessage();
                  }
                },
                onAudioTapped: () {
                  if (controller.inputC.text.trim().isEmpty) {
                    debugPrint('AUDIO TAP');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
