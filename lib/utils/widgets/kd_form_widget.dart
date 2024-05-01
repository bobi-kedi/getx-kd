part of 'app_widgets.dart';

class KdFormInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FormInputType? formInputType;
  final String? Function(String?)? validator;
  final Function()? onShowPassword;
  final String? requireLabel;
  final bool showErrorText;
  final bool obscureText;
  final bool isEnabled;
  final bool isReadOnly;
  const KdFormInputWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.formInputType = FormInputType.text,
    this.onShowPassword,
    this.validator,
    this.requireLabel,
    this.showErrorText = false,
    this.obscureText = false,
    this.isEnabled = true,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    switch (formInputType) {
      case FormInputType.email:
        return EmailInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          validator: validator,
          requireLabel: requireLabel,
          showErrorText: showErrorText,
          isEnabled: isEnabled,
          isReadOnly: isReadOnly,
        );
      case FormInputType.number:
        return NumberInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          validator: validator,
          requireLabel: requireLabel,
          isReadOnly: isReadOnly,
        );
      case FormInputType.phone:
        return PhoneInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          validator: validator,
          requireLabel: requireLabel,
          isEnabled: isEnabled,
        );
      case FormInputType.password:
        return PasswordInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          validator: validator,
          requireLabel: requireLabel,
          onShowPassword: onShowPassword,
          obscureText: obscureText,
        );
      default:
        return TextInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          validator: validator,
          requireLabel: requireLabel,
          isEnabled: isEnabled,
          isReadOnly: isReadOnly,
        );
    }
  }
}
