import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:lottie/lottie.dart';

class KdMaintenanceWidget extends StatelessWidget {
  const KdMaintenanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: KdColor.neutral10.withOpacity(0.5),
                  border: Border.all(
                    color: KdColor.neutral30,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Lottie.asset(KdAssetsAnimationsPath.underMaintenance),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Under Construction',
                style: KdTextStyles.heading4Medium.copyWith(
                  color: KdColor.primary70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'Coming soon, we are working on this feature',
              style:
                  KdTextStyles.body2Medium.copyWith(color: KdColor.neutral50),
            )
          ],
        ),
      ),
    );
  }
}
