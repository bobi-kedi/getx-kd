part of 'app_widgets.dart';

class KdAlertDialogWidget extends StatelessWidget {
  const KdAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: CircularProgressIndicator(
            color: KdColor.primary70,
          ),
        ),
      ),
    );
  }
}
