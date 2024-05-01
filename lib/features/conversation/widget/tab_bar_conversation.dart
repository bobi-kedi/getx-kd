import 'package:flutter/material.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

class TabBarConversation extends StatelessWidget {
  final String text;
  final bool selectedTab;
  final int unRead;
  const TabBarConversation({
    super.key,
    required this.text,
    required this.selectedTab,
    this.unRead = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: (selectedTab) ? Colors.transparent : KdColor.neutral30,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: text,
                    style: KdTextStyles.button2Bold.copyWith(
                      color:
                          (selectedTab) ? KdColor.primary90 : KdColor.neutral50,
                    ),
                  ),
                  if (unRead != 0)
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 4),
                          Container(
                            height: 15,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: (selectedTab)
                                  ? KdColor.primary70
                                  : KdColor.neutral50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '$unRead',
                                style: KdTextStyles.caption2Regular
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
            // Text(text),
            ),
      ),
    );
  }
}
