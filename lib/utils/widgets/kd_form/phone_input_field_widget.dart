part of 'app_kd_form.dart';

class PhoneInputFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? requireLabel;
  final bool isEnabled;

  const PhoneInputFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.requireLabel,
    this.isEnabled = true,
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
          Row(
            children: [
              Expanded(
                child: InternationalPhoneNumberInput(
                  textFieldController: controller,
                  isEnabled: isEnabled,
                  scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  onInputChanged: (PhoneNumber number) {
                    debugPrint(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    debugPrint('$value');
                  },
                  textStyle: KdTextStyles.field1Regular.copyWith(
                    color: KdColor.neutral70,
                  ),
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    useBottomSheetSafeArea: true,
                    trailingSpace: false,
                  ),
                  cursorColor: KdColor.primary70,
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: KdTextStyles.field1Regular.copyWith(
                    color: KdColor.neutral70,
                  ),
                  initialValue: PhoneNumber(isoCode: 'ID'),
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  inputDecoration: InputDecoration(
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
                  searchBoxDecoration: InputDecoration(
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
                    hintText: 'Search country or dial code',
                    hintStyle: KdTextStyles.field1Regular.copyWith(
                      color: KdColor.neutral50,
                    ),
                  ),
                  onSaved: (PhoneNumber number) {
                    debugPrint('On Saved: $number');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
