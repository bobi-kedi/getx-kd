part of 'app_ui.dart';

class KdDialog {
  static Future<void> dialogButton(
    BuildContext context, {
    String? title,
    String? body,
    Widget? customTitle,
    Widget? customBody,
    String? textBtn,
    String? textSecondBtn,
    dynamic onPressed,
    bool withButtonClose = false,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => KdDialogWidget(
        title: title,
        customTitle: customTitle,
        withButtonClose: withButtonClose,
        body: body,
        customBody: customBody,
        textBtn: textBtn,
        textSecondBtn: textSecondBtn,
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
      ),
    );
  }

  static Future<void> loading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => const KdAlertDialogWidget(),
    );
  }

  static Future<void> bottomSheet({
    required BuildContext context,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      isDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return child;
      },
    );
  }

  static Future<void> dialog(
      {required BuildContext context, required Widget content}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        content: content,
      ),
    );
  }
}
