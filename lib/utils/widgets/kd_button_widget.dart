part of 'app_widgets.dart';

class KdButtonWidget extends StatelessWidget {
  final String text;
  final ButtonType buttonType;
  final ButtonSizeType buttonSizeType;
  final Function() onTapped;
  final String? icon;
  final Color? color;
  const KdButtonWidget({
    super.key,
    required this.text,
    required this.onTapped,
    this.buttonType = ButtonType.primary,
    this.buttonSizeType = ButtonSizeType.large,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return _ButtonPrimary(
          text: text,
          size: buttonSizeType.value,
          onTapped: onTapped,
          icon: icon,
          color: color,
        );
      case ButtonType.secondary:
        return _ButtonSecondary(
          text: text,
          size: buttonSizeType.value,
          onTapped: onTapped,
          icon: icon,
        );
      case ButtonType.tertiary:
        return _ButtonTertiary(
          text: text,
          size: buttonSizeType.value,
          onTapped: onTapped,
          icon: icon,
        );
      case ButtonType.disable:
        return _ButtonDisable(
          text: text,
          size: buttonSizeType.value,
          onTapped: null,
          icon: icon,
        );
      default:
        return Container();
    }
  }
}

class _ButtonPrimary extends StatelessWidget {
  final String text;
  final double size;
  final Function() onTapped;
  final String? icon;
  final Color? color;
  const _ButtonPrimary({
    required this.text,
    required this.size,
    required this.onTapped,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        elevation: 15,
        backgroundColor: (color != null) ? color : KdColor.primary70,
        shadowColor: (color != null)
            ? color?.withOpacity(0.25)
            : KdColor.primary70.withOpacity(0.25),
        minimumSize: Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(icon!),
            ),
          Text(
            text,
            style: (size == ButtonSizeType.small.value)
                ? KdTextStyles.button2Medium.copyWith(
                    color: (color != null) ? Colors.white : KdColor.primary10,
                  )
                : KdTextStyles.button1Medium.copyWith(
                    color: (color != null) ? Colors.white : KdColor.primary10,
                  ),
          ),
        ],
      ),
    );
  }
}

class _ButtonSecondary extends StatelessWidget {
  final String text;
  final double size;
  final Function() onTapped;
  final String? icon;
  const _ButtonSecondary({
    required this.text,
    required this.size,
    required this.onTapped,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        elevation: 15,
        backgroundColor: KdColor.primary30,
        shadowColor: KdColor.primary30.withOpacity(0.25),
        minimumSize: Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(icon!),
            ),
          Text(
            text,
            style: (size == ButtonSizeType.small.value)
                ? KdTextStyles.button2Medium.copyWith(
                    color: KdColor.primary70,
                  )
                : KdTextStyles.button1Medium.copyWith(
                    color: KdColor.primary70,
                  ),
          ),
        ],
      ),
    );
  }
}

class _ButtonTertiary extends StatelessWidget {
  final String text;
  final double size;
  final Function() onTapped;
  final String? icon;
  const _ButtonTertiary({
    required this.text,
    required this.size,
    required this.onTapped,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: KdColor.primary10,
        minimumSize: Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(icon!),
            ),
          Text(
            text,
            style: (size == ButtonSizeType.small.value)
                ? KdTextStyles.button2Medium.copyWith(
                    color: KdColor.primary90,
                  )
                : KdTextStyles.button1Medium.copyWith(
                    color: KdColor.primary90,
                  ),
          ),
        ],
      ),
    );
  }
}

class _ButtonDisable extends StatelessWidget {
  final String text;
  final double size;
  final Function()? onTapped;
  final String? icon;
  const _ButtonDisable({
    this.onTapped,
    required this.text,
    required this.size,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: KdColor.neutral30,
        minimumSize: Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(icon!),
            ),
          Text(
            text,
            style: (size == ButtonSizeType.small.value)
                ? KdTextStyles.button2Medium.copyWith(
                    color: KdColor.neutral90,
                  )
                : KdTextStyles.button1Medium.copyWith(
                    color: KdColor.neutral90,
                  ),
          ),
        ],
      ),
    );
  }
}
