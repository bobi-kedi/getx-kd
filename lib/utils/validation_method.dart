class ValidationMethod {
  static String? isEmailValid(String? value) {
    String regEx =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(regEx).hasMatch(value!) ? null : 'Enter a valid Email';
  }
}
