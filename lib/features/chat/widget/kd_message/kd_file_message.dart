part of 'kd_message.dart';

class KdFileMessage extends StatelessWidget {
  final String message;
  final String messageAt;
  final bool isMe;
  const KdFileMessage({
    super.key,
    required this.message,
    required this.messageAt,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: (isMe) ? 16 : 50, left: (isMe) ? 50 : 16, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  (isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (isMe) ? KdColor.primary70 : KdColor.neutral10,
                      borderRadius: (isMe)
                          ? const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: (isMe)
                                          ? KdColor.primary50.withOpacity(0.4)
                                          : KdColor.neutral30.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.file_present_rounded,
                                        color: (isMe)
                                            ? Colors.white
                                            : KdColor.primary70),
                                  ),
                                ),
                                const WidgetSpan(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'City_guide_madrid.pdf',
                                        style:
                                            KdTextStyles.body3Regular.copyWith(
                                          color: (isMe)
                                              ? KdColor.neutral10
                                              : KdColor.neutral90,
                                        ),
                                      ),
                                      Text(
                                        '5kb',
                                        style: KdTextStyles.caption1Regular
                                            .copyWith(
                                          color: (isMe)
                                              ? KdColor.primary10
                                                  .withOpacity(0.7)
                                              : KdColor.neutral50
                                                  .withOpacity(0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       width: 40,
                          //       height: 40,
                          //       decoration: BoxDecoration(
                          //         color: KdColor.primary50.withOpacity(0.4),
                          //         shape: BoxShape.circle,
                          //       ),
                          //       child: const Icon(
                          //         Icons.attach_email,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              if (isMe)
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.done_all_rounded,
                                      size: 12,
                                      color: (isMe)
                                          ? KdColor.primary10
                                          : KdColor.neutral50,
                                    ),
                                  ),
                                ),
                              TextSpan(
                                text: messageAt,
                                style: KdTextStyles.caption2Regular.copyWith(
                                  color: (isMe)
                                      ? KdColor.primary10
                                      : KdColor.neutral50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
