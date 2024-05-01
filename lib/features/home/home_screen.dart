import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

import 'home_controller.dart';
import 'widgets/header_home.dart';
import 'widgets/user_story_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HeaderHome(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: Get.width,
                    height: 120,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => UserStoryHome(
                        index: index,
                        name: 'Nama Pengguna',
                        imageUrl:
                            'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: Get.width,
                //   padding: const EdgeInsets.only(bottom: 30),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     child: KdButtonWidget(
                //       text: 'Buat Kelas',
                //       onTapped: () {
                //         controller.createClassrooom(context);
                //       },
                //     ),
                //   ),
                // ),
                const KdFeedWidget(
                  name: 'STIH Adhyaksa',
                  isVerified: true,
                  isFriend: true,
                  imageUrl:
                      'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
                  listImageFeed: [
                    'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png'
                  ],
                ),
                const KdFeedWidget(
                  name: 'Adam David',
                  listImageFeed: ['https://source.unsplash.com/user/wsanter'],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
