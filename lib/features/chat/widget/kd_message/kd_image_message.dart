part of 'kd_message.dart';

class KdImageMessage extends StatelessWidget {
  final String message;
  final String messageAt;
  final bool isMe;
  const KdImageMessage({
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
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (isMe) ? KdColor.primary70 : KdColor.neutral10,
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://source.unsplash.com/user/wsanter'),
                            fit: BoxFit.cover,
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
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            color: KdColor.neutral90.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  if (isMe)
                                    const WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Icons.done_all_rounded,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  TextSpan(
                                    text: messageAt,
                                    style:
                                        KdTextStyles.caption2Regular.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
