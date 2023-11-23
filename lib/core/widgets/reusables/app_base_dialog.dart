import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

class AppBaseDialog extends StatelessWidget {
  const AppBaseDialog({
    super.key,
    required this.content,
    this.actions,
    this.backgroundColor,
    this.pop,
  });
  final Widget content;
  final VoidCallback? pop;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      elevation: 0,
      backgroundColor:
          backgroundColor ?? context.appColors.background.withOpacity(0.5),
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
        padding: Sizes.defaultDialogPadding,
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), child: content),
      ),
    );
  }
}
