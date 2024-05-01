part of 'kd_message.dart';

class KdCustomMessage extends StatelessWidget {
  final String message;
  final String messageAt;
  final bool isMe;
  const KdCustomMessage({
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
                      border: Border.all(
                        width: 2.0,
                        color: KdColor.primary70,
                      ),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text(
                                  'UTS Bahasa Jepang',
                                  style: KdTextStyles.body1Bold.copyWith(
                                    color: KdColor.primary70,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry dskdksd mksdmskdsmsdmksdkmsk',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: KdTextStyles.body3Regular.copyWith(
                                      color: KdColor.neutral90,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  debugPrint('ID Material');
                                },
                                child: Center(
                                  child: Container(
                                    width: 145,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff9D21E6),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff9D21E6)
                                              .withOpacity(0.25),
                                          blurRadius: 15.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(
                                            0.0,
                                            7.0,
                                          ), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Buka UTS',
                                        style: TextStyle(
                                          color: Color(0xffF4EBFE),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                          ? KdColor.primary50
                                          : KdColor.neutral50,
                                    ),
                                  ),
                                ),
                              TextSpan(
                                text: messageAt,
                                style: KdTextStyles.caption2Regular.copyWith(
                                  color: (isMe)
                                      ? KdColor.primary50
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
