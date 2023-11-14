import 'package:flutter/material.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppFilterButton extends StatelessWidget {
  const AppFilterButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.filter_list_sharp),
      label: const AppText(text: 'Filter'),
    );
  }
}
