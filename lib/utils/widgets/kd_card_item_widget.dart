part of 'app_widgets.dart';

class KdCardItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final bool selectedIndex;
  final Color? color;
  final double paddingHorizontal;
  const KdCardItemWidget({
    super.key,
    required this.image,
    required this.title,
    this.selectedIndex = false,
    this.color,
    this.paddingHorizontal = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: (selectedIndex) ? KdColor.primary70 : Colors.white,
          border: Border.all(
            color: (selectedIndex) ? KdColor.primary70 : KdColor.neutral50,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      (selectedIndex) ? KdColor.primary70 : KdColor.neutral30,
                ),
                borderRadius: BorderRadius.circular(20),
                color: (color != null) ? color : const Color(0xff6E00CE),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: KdTextStyles.body1Medium.copyWith(
                color: (selectedIndex) ? KdColor.neutral10 : KdColor.neutral90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
