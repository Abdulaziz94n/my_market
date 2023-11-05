import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

class AppYearPicker extends StatelessWidget {
  const AppYearPicker(
      {super.key, required this.selectedDate, required this.onChanged});
  final void Function(DateTime) onChanged;
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return AlertDialog(
      content: SizedBox(
        height: context.screenHeight * 0.40,
        child: YearPicker(
          firstDate: DateTime(now.year - 1),
          lastDate: DateTime(now.year),
          selectedDate: selectedDate,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
