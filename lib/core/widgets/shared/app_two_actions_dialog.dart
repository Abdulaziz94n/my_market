import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_market/core/widgets/reusables/app_base_dialog.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

import '../../extensions/build_context_extension.dart';
import '/core/constants/sizes.dart';

class AppTwoActionsAlert extends StatelessWidget {
  const AppTwoActionsAlert({
    super.key,
    required this.content,
    this.onAction,
    this.pop,
    this.actionText,
    this.cancelText,
    this.backgroundColor,
  });
  final String? cancelText;
  final String? actionText;
  final Widget content;
  final VoidCallback? onAction;
  final VoidCallback? pop;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBaseDialog(
        backgroundColor: backgroundColor,
        actions: [
          if (context.isIos) ...[
            CupertinoDialogAction(
              onPressed: onAction ?? context.pop,
              child: Text(actionText ?? 'Okay'),
            ),
            CupertinoDialogAction(
              onPressed: pop ?? context.pop,
              child: Text(cancelText ?? 'Cancel'),
            ),
          ],
          if (!context.isIos) ...[
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.appColors.success,
              ),
              onPressed: onAction ?? context.pop,
              child: Text(actionText ?? 'Okay'),
            ),
            const HorizontalSpacingWidget(Sizes.p16),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.appColors.error,
              ),
              onPressed: pop ?? context.pop,
              child: Text(cancelText ?? 'Cancel'),
            ),
          ]
        ],
        content: content);
  }
}
