import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class CardItemClassroom extends StatelessWidget {
  final String lectureName;
  final String classroomName;
  final bool? isCreator;
  final String? imageUrl;
  final String? description;
  final int? unRead;
  final String? lastMessage;
  final String? lastMessageAt;
  final Function() onTapped;
  const CardItemClassroom({
    super.key,
    required this.lectureName,
    required this.classroomName,
    this.isCreator = false,
    this.description,
    this.imageUrl,
    this.unRead = 0,
    this.lastMessage,
    this.lastMessageAt,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: KdColor.neutral50,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: KdPictureWidget(
                      imageUrl: imageUrl,
                      size: 60,
                      radius: 15,
                      isGroup: true,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              lectureName,
                              style: KdTextStyles.body3Regular.copyWith(
                                color: KdColor.primary90,
                              ),
                            ),
                            if (isCreator!)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: KdColor.primary70,
                                  size: 16,
                                ),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          classroomName,
                          style: KdTextStyles.body1Bold.copyWith(
                            color: KdColor.neutral90,
                          ),
                        ),
                      ),
                      if (description != null)
                        Text(
                          description!,
                          style: KdTextStyles.caption2Regular.copyWith(
                            color: KdColor.neutral90,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              if (lastMessage != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '$lastMessageAt',
                          style: KdTextStyles.caption2Regular
                              .copyWith(color: KdColor.neutral50),
                        ),
                      ),
                      if (unRead != 0)
                        Container(
                          height: 15,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: KdColor.primary70,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              '$unRead',
                              style: KdTextStyles.caption2Regular.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
