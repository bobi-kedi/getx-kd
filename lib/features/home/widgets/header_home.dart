import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/features/home/home_controller.dart';
import 'package:kelasdigital/utils/enums.dart';
import 'package:kelasdigital/utils/ui/app_ui.dart';
import 'package:kelasdigital/utils/widgets/app_widgets.dart';

class HeaderHome extends GetView<HomeController> {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 9,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      KdAssetsImagesPath.logosText,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              const SizedBox(width: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('Search Clicked');
                        },
                        child: const Icon(Icons.search, size: 24),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('Created Clicked');
                          KdDialog.bottomSheet(
                            context: context,
                            child: childBottomSheet(context),
                          );
                        },
                        child: const Icon(Icons.add_box_outlined, size: 24),
                      ),
                      Obx(
                        () => (controller.profileC.isLoading)
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(),
                              )
                            : KdPictureWidget(
                                imageUrl: controller.profileC.imageUrl,
                                size: 24,
                                radius: 6,
                                onTapped: () {
                                  controller.goToProfile();
                                },
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('Notification Clicked');
                        },
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget childBottomSheet(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffCCCBCB),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: KdButtonWidget(
                text: 'Buat Kelas',
                onTapped: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: KdButtonWidget(
                text: 'Post',
                buttonType: ButtonType.secondary,
                onTapped: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
