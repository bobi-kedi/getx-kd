import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

class AlertLogout extends StatelessWidget {
  const AlertLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.highlight_off_outlined,
              color: KdColor.neutral70,
              size: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Rekening Bank',
            style: KdTextStyles.body1Bold.copyWith(
              color: KdColor.neutral70,
            ),
          ),
        ),
        Text(
          'Info rekening bank diperlukan saat Anda akan melakukan pengembalian dana atau penarikan saldo dari kelas berbayar yang Anda buat di Kelas Digital',
          style: KdTextStyles.body2Medium.copyWith(
            color: KdColor.neutral70,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
