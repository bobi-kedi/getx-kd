import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'widget/content_profile.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Profile',
          style: KdTextStyles.heading5SemiBold
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KdColor.primary10,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: KdColor.primary70,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                controller.goToOther();
              },
              child: SvgPicture.asset(KdAssetsSvgsPath.icBurger),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const KdPictureWidget(
                          size: 65,
                          radius: 15,
                          imageUrl:
                              'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _infoWidget(title: 'Kelas Aktif', value: '10'),
                              _infoWidget(title: 'Dosen', value: '15'),
                              _infoWidget(title: 'GPA', value: '3.2'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: Get.width,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${controller.currentUser?.fullname}',
                              style: KdTextStyles.body1Medium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          if (controller.currentUser!.isVerifiedAccount!)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.verified_rounded,
                                size: 15,
                                color: KdColor.primary70,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.currentUser?.username != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          '@${controller.currentUser?.username}',
                          style: KdTextStyles.caption1Medium
                              .copyWith(color: KdColor.primary70),
                        ),
                      );
                    }
                    return Container();
                  }),
                  KdButtonWidget(
                    text: 'Detail Profile',
                    buttonType: ButtonType.tertiary,
                    onTapped: () {
                      controller.goToDetailProfile();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const ContentProfile(),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget({
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: KdTextStyles.body2Regular.copyWith(
            color: KdColor.neutral70,
          ),
        ),
        Text(
          value,
          style: KdTextStyles.body1Bold.copyWith(
            color: KdColor.neutral90,
          ),
        ),
      ],
    );
  }
}
