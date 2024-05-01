enum ButtonType {
  primary('primary'),
  secondary('secondary'),
  tertiary('tertiary'),
  disable('disable');

  final String value;
  const ButtonType(this.value);
}

enum ButtonSizeType {
  large(55.0),
  medium(42.0),
  small(32.0);

  final double value;
  const ButtonSizeType(this.value);
}

enum FormInputType {
  text('text'),
  number('number'),
  phone('phone'),
  email('email'),
  password('password');

  final String value;
  const FormInputType(this.value);
}
