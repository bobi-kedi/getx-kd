import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

class OtherItem extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final Function() onTapped;
  final IconData? trailingIcon;
  final bool isCustomItem;
  const OtherItem({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.onTapped,
    this.trailingIcon = Icons.arrow_forward_ios_outlined,
    this.isCustomItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: (isCustomItem) ? KdColor.error70 : Colors.white,
            border: Border.all(
              color: (isCustomItem)
                  ? KdColor.error70
                  : KdColor.neutral50.withOpacity(0.8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        leadingIcon,
                        size: 24,
                        color:
                            (isCustomItem) ? Colors.white : KdColor.neutral70,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: KdTextStyles.body1Medium.copyWith(
                            color: (isCustomItem)
                                ? Colors.white
                                : KdColor.neutral70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  trailingIcon,
                  size: 24,
                  color: (isCustomItem) ? Colors.white : KdColor.neutral70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
