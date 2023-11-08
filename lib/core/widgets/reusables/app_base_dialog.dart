import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

class AppBaseDialog extends StatelessWidget {
  const AppBaseDialog({
    super.key,
    required this.content,
    this.actions,
    this.pop,
  });
  final Widget content;
  final VoidCallback? pop;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      elevation: 0,
      backgroundColor: context.appColors.background.withOpacity(0.5),
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.only(bottom: 28),
      actionsOverflowButtonSpacing: 0,
      actionsOverflowAlignment: OverflowBarAlignment.end,
      actions: actions,
      content: Padding(
        padding: const EdgeInsets.all(36),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), child: content),
      ),
    );
  }
}
