import 'package:flutter/material.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppFilterPopupButton extends StatelessWidget {
  const AppFilterPopupButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.filter_list_sharp,
          size: 18,
        ),
        label: const AppText(text: 'Filter'),
      ),
    );
  }
}
