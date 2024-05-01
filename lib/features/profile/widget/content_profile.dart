import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/features/profile/profile_controller.dart';

class ContentProfile extends GetView<ProfileController> {
  const ContentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.listTabs.length,
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    if (controller.selectedIndex.value != index) {
                      controller.selectedIndex.value = index;
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: EdgeInsets.only(
                        left: (index == 0) ? 16 : 10,
                        right: (index == 4) ? 16 : 0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                    decoration: BoxDecoration(
                      color: (controller.selectedIndex.value == index)
                          ? KdColor.primary30
                          : KdColor.neutral30,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        controller.listTabs[index],
                        style: KdTextStyles.button2Bold.copyWith(
                          color: (controller.selectedIndex.value == index)
                              ? KdColor.primary90
                              : KdColor.neutral50,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(
              10,
              (index) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: (index == 4) ? Colors.amber : Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
