import 'package:flutter/material.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonConversation extends StatelessWidget {
  final int count;
  const SkeletonConversation({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: KdColor.neutral30,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: KdColor.neutral70,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 12,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: KdColor.neutral70,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      height: 12,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: KdColor.neutral70,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: KdColor.neutral70,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
