import 'package:flutter/services.dart';
import 'package:my_market/core/utils/patterns_utils.dart';

mixin AppTextFormatter {
  TextInputFormatter numOnlyZeroFormatter() =>
      FilteringTextInputFormatter.allow(Patterns.double);

  TextInputFormatter amountInputFormatter() =>
      FilteringTextInputFormatter.allow(Patterns.amountTextFieldInputter);

  CommaTextInputFormatter intWithCommasFormatter() {
    CommaTextInputFormatter commaFormatter = CommaTextInputFormatter();
    return commaFormatter;
  }
}

///
///
///

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numericValue = int.tryParse(newValue.text.replaceAll(',', '')) ?? 0;
    final formattedValue = _formatWithCommas(numericValue);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  String _formatWithCommas(int value) {
    final stringValue = value.toString();
    final segments = stringValue.split('').reversed;

    final formattedSegments = <String>[];
    for (var i = 0; i < segments.length; i++) {
      if (i != 0 && i % 3 == 0) {
        formattedSegments.add(',');
      }
      formattedSegments.add(segments.elementAt(i));
    }

    return formattedSegments.reversed.join();
  }
}
