import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/features/conversation/conversation_controller.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class HeaderConversation extends GetView<ConversationController> {
  const HeaderConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 115,
      padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 170,
            child: Text(
              'Kelas',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColor.neutral90,
              ),
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.search, size: 24),
                  const Icon(Icons.person_outline, size: 24),
                  Obx(
                    () => (controller.profileController.isLoading)
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          )
                        : KdPictureWidget(
                            imageUrl: controller.profileController.imageUrl,
                            size: 24,
                            radius: 6,
                            onTapped: () {
                              controller.goToProfile();
                            },
                          ),
                  ),
                  // KdPictureWidget(
                  //   imageUrl: 'https://source.unsplash.com/user/wsanter',
                  //   size: 24,
                  //   radius: 6,
                  //   onTapped: () {
                  //     debugPrint('Profile Clicked');
                  //   },
                  // ),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
