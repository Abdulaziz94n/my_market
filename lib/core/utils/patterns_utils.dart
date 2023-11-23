class Patterns {
  static RegExp double = RegExp(r'^\d*\,?(\d{0,2})?');
  static RegExp maskedAmount = RegExp(r'^(\d{1,3})([,]\d{1,3})*([.]\d{2})');
  static RegExp amountTextFieldInputter =
      RegExp(r'^([0-9]+)(,?(\d+)?)*(\.?\d*)');
  static RegExp amount = RegExp(r'^[0-9],');
}
