import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class HeaderChatPrivate extends StatelessWidget {
  final bool isFriend;
  const HeaderChatPrivate({
    super.key,
    this.isFriend = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: KdColor.primary70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 55),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 10),
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: 0.6,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: KdColor.primary70,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0 - .0),
                      child: Stack(
                        children: [
                          const KdPictureWidget(
                            size: 50,
                            radius: 15,
                            isGroup: true,
                          ),
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: KdColor.primary70,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 7,
                                  height: 7,
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
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        'Kelas Digital',
                                        style: KdTextStyles.body1Bold.copyWith(
                                          color: Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.verified,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  // WidgetSpan(
                                  //   alignment: PlaceholderAlignment.middle,
                                  //   child: Container(
                                  //     width: 8,
                                  //     height: 8,
                                  //     decoration: BoxDecoration(
                                  //       color: KdColor.success70,
                                  //       shape: BoxShape.circle,
                                  //     ),
                                  //   ),
                                  // ),
                                  TextSpan(
                                    text: 'Service Notification',
                                    style: KdTextStyles.body3Regular.copyWith(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (!isFriend)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add_alt,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
