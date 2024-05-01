part of 'app_widgets.dart';

class KdAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const KdAppbarWidget({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        'Profile',
        style:
            KdTextStyles.heading5SemiBold.copyWith(fontWeight: FontWeight.w600),
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: KdColor.primary10,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: KdColor.primary70,
              size: 20,
            ),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
