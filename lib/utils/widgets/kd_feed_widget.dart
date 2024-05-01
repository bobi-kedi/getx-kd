part of 'app_widgets.dart';

class KdFeedWidget extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool? isVerified;
  final bool isFriend;
  final List<String> listImageFeed;
  const KdFeedWidget({
    super.key,
    required this.name,
    this.imageUrl,
    this.isVerified = false,
    this.isFriend = false,
    required this.listImageFeed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      KdPictureWidget(
                        imageUrl: imageUrl,
                        size: 40,
                        radius: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 2 + 10,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        name,
                                        style: KdTextStyles.body1Bold.copyWith(
                                          color: KdColor.neutral90,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  if (isVerified!)
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            KdAssetsImagesPath.verified,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              'Rekayasa Bio Energi',
                              style: KdTextStyles.body2Regular.copyWith(
                                color: KdColor.neutral70,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  if (!isFriend)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add_alt,
                        size: 24,
                        color: KdColor.primary70,
                      ),
                    ),
                  IconButton(
                    onPressed: () {
                      KdDialog.bottomSheet(
                        context: context,
                        child: childBottomSheet(context),
                      );
                    },
                    icon: Icon(
                      Icons.more_vert,
                      size: 24,
                      color: KdColor.neutral90,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (listImageFeed.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(listImageFeed.first),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            height: 40,
            color: KdColor.success70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ikut Kelas',
                    style: KdTextStyles.body1Regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.5,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InteractiveFeedWidget(
                        // icon: KdAssetsSvgsPath.feedsLike,
                        icon: Icons.thumb_up_off_alt_outlined,
                        count: 100,
                        onTapped: () {
                          debugPrint('Like OnTapped');
                        },
                      ),
                      InteractiveFeedWidget(
                        // icon: KdAssetsSvgsPath.feedsView,
                        icon: Icons.group_outlined,
                        count: 50,
                        onTapped: () {
                          debugPrint('View OnTapped');
                        },
                      ),
                      InteractiveFeedWidget(
                        // icon: KdAssetsSvgsPath.feedsComment,
                        icon: Icons.chat_bubble_outline,
                        count: 25,
                        onTapped: () {
                          debugPrint('Comment OnTapped');
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    InteractiveFeedWidget(
                      // icon: KdAssetsSvgsPath.feedsShare,
                      icon: Icons.near_me_outlined,
                      onTapped: () {
                        debugPrint('Shared OnTapped');
                      },
                    ),
                    const SizedBox(width: 10),
                    InteractiveFeedWidget(
                      // icon: KdAssetsSvgsPath.feedsBookmark,
                      icon: Icons.bookmark_border_outlined,
                      onTapped: () {
                        debugPrint('Bookmark OnTapped');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Kelas Flutter - 3 sesi',
                    style: KdTextStyles.heading6SemiBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Daftar : 25 Sept 2022 - 30 Sept 2022',
                    style: KdTextStyles.body2Regular
                        .copyWith(color: KdColor.neutral70),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                    style: KdTextStyles.body2Regular.copyWith(
                      color: KdColor.neutral70,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  '15 October 2022',
                  style: KdTextStyles.caption2Regular.copyWith(
                    color: KdColor.neutral50,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget childBottomSheet(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffCCCBCB),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: KdButtonWidget(
                text: 'Laporkan Konten',
                buttonType: ButtonType.secondary,
                onTapped: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: KdButtonWidget(
                text: 'Laporkan Pengguna',
                buttonType: ButtonType.secondary,
                onTapped: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class InteractiveFeedWidget extends StatelessWidget {
  final IconData icon;
  final int? count;
  final Function()? onTapped;
  const InteractiveFeedWidget({
    super.key,
    required this.icon,
    this.count = 0,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTapped != null) {
          onTapped!();
        }
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: (count != 0) ? 5 : 0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                icon,
                size: 24,
              ),
            ),
          ),
          if (count != 0)
            Text(
              '$count',
              style: KdTextStyles.caption2Regular.copyWith(
                color: KdColor.neutral90,
              ),
            )
        ],
      ),
    );
  }
}
