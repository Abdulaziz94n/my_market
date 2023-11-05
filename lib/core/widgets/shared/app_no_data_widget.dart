import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/widgets/shared/app_text.dart';

class AppNoDataWidget extends StatelessWidget {
  const AppNoDataWidget({
    super.key,
    this.text,
    this.actionText,
    this.onPressed,
  });
  final String? text;
  final String? actionText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: text ?? 'No Data To Show',
          ),
          ElevatedButton(
            onPressed: onPressed ?? () => context.pop(),
            child: AppText(text: actionText ?? 'Back'),
          )
        ],
      ),
    );
  }
}
