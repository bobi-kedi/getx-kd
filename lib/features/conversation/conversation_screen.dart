import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

import 'widget/card_item_chat.dart';
import 'widget/card_item_classroom.dart';
import 'widget/header_conversation.dart';
import 'widget/skeleton_conversation.dart';
import 'widget/tab_bar_conversation.dart';
import 'conversation_controller.dart';

class ConversationScreen extends GetView<ConversationController> {
  const ConversationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HeaderConversation(),
        const SizedBox(height: 12),
        Obx(
          () => TabBar(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.white,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: KdColor.neutral50,
            unselectedLabelStyle: KdTextStyles.button2Medium.copyWith(
              color: KdColor.neutral50,
            ),
            labelStyle: KdTextStyles.button2Medium.copyWith(
              color: KdColor.primary90,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: KdColor.primary30,
            ),
            tabs: [
              TabBarConversation(
                text: 'Kelas Aktif',
                selectedTab: controller.tabIndex.value == 0,
              ),
              TabBarConversation(
                text: 'Chat',
                selectedTab: controller.tabIndex.value == 1,
                unRead: 7,
              ),
            ],
            controller: controller.tabController,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CardItemClassroom(
                        lectureName: 'Cindi Astria',
                        classroomName: 'Pendidikan Pancasila',
                        isCreator: true,
                        description: 'PP192052  |  2 SKS  |  Senin 08:00',
                        onTapped: () {
                          controller.goToChat(isGroup: true);
                        },
                      ),
                      CardItemClassroom(
                        lectureName: 'Yanti Sulistiowati',
                        classroomName: 'Administrasi Perkantoran',
                        onTapped: () {
                          controller.goToChat(isGroup: true);
                        },
                      ),
                      const SkeletonConversation(count: 2),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CardItemChat(
                        name: 'TIF 19KM',
                        lastMessage: 'Andini created the group "TIF 19KM"',
                        lastMessageAt: '19.57',
                        isGroup: true,
                        onTapped: () {
                          controller.goToChat(isGroup: true);
                        },
                      ),
                      CardItemChat(
                        name: 'Kelas Digital',
                        isVerified: true,
                        unRead: 1,
                        isGroup: true,
                        lastMessageAt: '13.00',
                        lastMessage: 'Hi, kedis',
                        onTapped: () {
                          controller.goToChat();
                        },
                      ),
                      CardItemChat(
                        name: 'Andini Afriyanti',
                        imageUrl:
                            'https://source.unsplash.com/random/900x700/?woman',
                        lastMessage:
                            'Dilansir dari www.lipsum.com, “Lorem Ipsum Dolor Sit Amet” merupakan teks dummy atau contoh teks dalam dunia percetakan. Kalimat tersebut mulai populer dan dipakai pada tahun',
                        lastMessageAt: '19.57',
                        isMe: true,
                        onTapped: () {
                          controller.goToChat();
                        },
                      ),
                      const SkeletonConversation(count: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
