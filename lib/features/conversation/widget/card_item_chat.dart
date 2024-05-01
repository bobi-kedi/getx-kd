import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class CardItemChat extends StatelessWidget {
  final String name;
  final bool isMe;
  final String? imageUrl;
  final bool? isVerified;
  final int? unRead;
  final String? lastMessage;
  final String? lastMessageAt;
  final Function() onTapped;
  final bool? isGroup;
  const CardItemChat({
    super.key,
    required this.name,
    this.isMe = false,
    this.imageUrl,
    this.isVerified = false,
    this.unRead = 0,
    this.lastMessage,
    this.lastMessageAt,
    required this.onTapped,
    this.isGroup = false,
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
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Stack(
                        children: [
                          KdPictureWidget(
                            imageUrl: imageUrl,
                            size: 60,
                            radius: 15,
                            isGroup: isGroup,
                          ),
                          if (!isGroup!)
                            Positioned(
                              bottom: 2,
                              right: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: KdColor.success50,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2 + 10,
                          // padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    name,
                                    style: KdTextStyles.body1Bold.copyWith(
                                      color: KdColor.neutral90,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              if (isVerified!)
                                Icon(
                                  Icons.verified,
                                  color: KdColor.primary70,
                                  size: 14,
                                ),
                            ],
                          ),
                        ),
                        if (lastMessage != null)
                          SizedBox(
                            width: Get.width / 2 + 10,
                            child: Text(
                              lastMessage!,
                              style: KdTextStyles.body3Regular.copyWith(
                                color: KdColor.neutral70,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (lastMessage != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            if (isMe)
                              Container(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.done_all_rounded,
                                  color: KdColor.primary70,
                                  size: 16,
                                ),
                              ),
                            Text(
                              '$lastMessageAt',
                              style: KdTextStyles.caption2Regular
                                  .copyWith(color: KdColor.neutral50),
                            ),
                          ],
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
