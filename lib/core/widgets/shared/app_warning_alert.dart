import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/constants/sizes.dart';
import '../../extensions/build_context_extension.dart';
import 'app_text.dart';

class AppWarningAlert extends StatelessWidget {
  const AppWarningAlert({
    super.key,
    required this.contentText,
    this.onAction,
    this.pop,
  });
  final String contentText;
  final VoidCallback? onAction;
  final VoidCallback? pop;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      actionsOverflowButtonSpacing: 0,
      actionsOverflowAlignment: OverflowBarAlignment.end,
      actions: [
        if (context.isIos) ...[
          CupertinoDialogAction(
            onPressed: onAction,
            child: const Text('Okay'),
          ),
          CupertinoDialogAction(
            onPressed: pop ?? context.pop,
            child: const Text('Cancel'),
          ),
        ],
        if (!context.isIos) ...[
          TextButton(
            onPressed: onAction,
            child: const Text('Okay'),
          ),
          TextButton(
            onPressed: pop ?? context.pop,
            child: const Text('Cancel'),
          ),
        ]
      ],
      content: SizedBox(
        height: Sizes.dialogDefaultHeight,
        child: Center(
          child: AppText(
            style: context.appTextTheme.bodyLarge!,
            text: contentText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
