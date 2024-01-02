import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/date_time_extension.dart';
import 'package:my_market/core/widgets/shared/app_bordered_text_field.dart';

import '/core/constants/sizes.dart';
import '/core/widgets/shared/app_text.dart';
import '/core/widgets/shared/spacing_widgets.dart';

class AppDateTextField extends StatelessWidget {
  const AppDateTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.onDateSelect,
    this.icon,
    this.selectedDate,
    this.firstDate,
    this.lastDate,
    this.validator,
    this.initialValue,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final String hint;
  final String? initialValue;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final IconData? icon;
  final DateTime? selectedDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime?> onDateSelect;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: '$title:',
        ),
        const VerticalSpacingWidget(Sizes.p4),
        AppBorderedTextField(
          mouseCursor: SystemMouseCursors.click,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              firstDate: firstDate ?? DateTime.now(),
              lastDate: lastDate ??
                  DateTime.now().add(
                    const Duration(days: 360),
                  ),
            );
            onDateSelect(date);
          },
          readOnly: true,
          initialValue: initialValue,
          hintText: selectedDate?.dateAsString ?? hint,
          textAlign: textAlign,
          prefixIcon: Icon(icon ?? Icons.abc),
          validator: validator,
        ),
      ],
    );
  }
}
