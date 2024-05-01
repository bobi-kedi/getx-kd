part of 'app_widgets.dart';

class KdSelectFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? requireLabel;
  const KdSelectFieldWidget({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.requireLabel,
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
          DropdownButtonFormField(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
              hintText: 'Selected Item',
              hintStyle: KdTextStyles.field1Regular.copyWith(
                color: KdColor.neutral50,
              ),
            ),
            validator: validator,
            dropdownColor: Colors.white,
            value: value,
            onChanged: onChanged,
            items: items,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
