import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class HeaderChatGroup extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;

  const HeaderChatGroup({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 2),
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
          const SizedBox(height: 50),
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
              // Expanded(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Padding(
              //         padding: EdgeInsets.only(right: 10.0),
              //         child: KdPictureWidget(
              //           size: 60,
              //           radius: 15,
              //         ),
              //       ),
              //       Flexible(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Enzi Arinda',
              //               style: KdTextStyles.body1Bold.copyWith(
              //                 color: Colors.white,
              //               ),
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 4.0),
              //               child: Row(
              //                 children: [
              //                   Container(
              //                     width: 8,
              //                     height: 8,
              //                     decoration: BoxDecoration(
              //                       shape: BoxShape.circle,
              //                       color: KdColor.success70,
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(left: 4.0),
              //                     child: Text(
              //                       'Active Now',
              //                       style:
              //                           KdTextStyles.caption1Regular.copyWith(
              //                         color: Colors.white,
              //                       ),
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: 16,
              //         height: 16,
              //         margin: const EdgeInsets.only(left: 5),
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage(
              //               KdAssetsImagesPath.verifiedWhite,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0 - .0),
                      child: KdPictureWidget(
                        imageUrl: imageUrl,
                        size: 50,
                        radius: 15,
                        isGroup: true,
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  title,
                                  style: KdTextStyles.body1Bold.copyWith(
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              description,
                              style: KdTextStyles.body3Regular.copyWith(
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam_outlined,
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
