import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/constants/sizes.dart';
import '../../extensions/build_context_extension.dart';
import 'app_text.dart';

class AppSuccessAlert extends StatelessWidget {
  const AppSuccessAlert({
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
      actions: [
        if (context.isIos)
          CupertinoDialogAction(
            onPressed: onAction,
            child: const Text('Okay'),
          ),
        if (!context.isIos)
          TextButton(
            onPressed: onAction,
            child: const Text('Okay'),
          ),
      ],
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      actionsOverflowButtonSpacing: 0,
      actionsOverflowAlignment: OverflowBarAlignment.end,
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
