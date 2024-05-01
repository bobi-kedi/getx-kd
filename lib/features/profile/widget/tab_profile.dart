import 'package:flutter/material.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

class TabBarProfile extends StatelessWidget {
  final String text;
  final bool selectedTab;
  const TabBarProfile({
    super.key,
    required this.text,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: (selectedTab) ? Colors.transparent : KdColor.neutral30,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Text(
            text,
            style: KdTextStyles.button2Bold.copyWith(
              color: (selectedTab) ? KdColor.primary90 : KdColor.neutral50,
            ),
          ),
        ),
      ),
    );
  }
}
