part of 'app_widgets.dart';

class KdPictureWidget extends StatelessWidget {
  final double size;
  final double radius;
  final String? imageUrl;
  final Function()? onTapped;
  final bool? isGroup;
  const KdPictureWidget({
    super.key,
    required this.size,
    required this.radius,
    this.imageUrl,
    this.onTapped,
    this.isGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: SizedBox(
        width: size,
        height: size,
        child: (imageUrl != null)
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                imageBuilder: (context, imageProvider) => Container(
                  width: size,
                  height: size,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KdColor.neutral50.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, progress) => Container(
                  padding: EdgeInsets.all(radius),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KdColor.neutral50.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                  ),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: KdColor.primary70,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: size,
                  height: size,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KdColor.neutral50.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(KdAssetsImagesPath.logosIcon),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                width: size,
                height: size,
                padding: (isGroup!)
                    ? const EdgeInsets.symmetric(vertical: 5)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: (isGroup!) ? Colors.white : Colors.transparent,
                  border: (isGroup!)
                      ? Border.all(
                          color: KdColor.neutral50.withOpacity(0.5),
                        )
                      : null,
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                    image: DecorationImage(
                      image: (isGroup!)
                          ? AssetImage(KdAssetsImagesPath.logosIcon)
                          : AssetImage(KdAssetsImagesPath.noPicture),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
