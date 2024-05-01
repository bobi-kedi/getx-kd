part of 'app_kd_form.dart';

class TextInputFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? requireLabel;
  final bool isEnabled;
  final bool isReadOnly;

  const TextInputFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.requireLabel,
    this.isEnabled = true,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: KdTextStyles.field1Bold.copyWith(
                      color: KdColor.neutral70,
                    ),
                  ),
                  if (requireLabel != null)
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '$requireLabel',
                          style: KdTextStyles.caption2Regular.copyWith(
                            color: KdColor.error70,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          TextFormField(
            readOnly: isReadOnly,
            enabled: isEnabled,
            controller: controller,
            scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            validator: validator,
            cursorColor: KdColor.primary70,
            style: KdTextStyles.field1Regular.copyWith(
              color: KdColor.neutral70,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: KdColor.neutral50,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: KdColor.neutral50,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: KdColor.primary90,
                ),
              ),
              hintText: hintText,
              hintStyle: KdTextStyles.field1Regular.copyWith(
                color: KdColor.neutral50,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
