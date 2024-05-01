import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class UserStoryHome extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String name;
  const UserStoryHome({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (index == 0) ? 15 : 0, right: 15),
      child: SizedBox(
        width: Get.width / 4.5,
        child: Column(
          children: [
            KdPictureWidget(
              imageUrl: imageUrl,
              size: 80,
              radius: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: KdTextStyles.body3Regular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
