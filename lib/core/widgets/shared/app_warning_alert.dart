import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/build_context_extension.dart';
import '/core/constants/sizes.dart';
import '/core/widgets/reusables/app_base_dialog.dart';
import '/core/widgets/reusables/app_dialog_icon.dart';
import '/core/widgets/shared/spacing_widgets.dart';
import 'app_text.dart';

class AppWarningAlert extends StatelessWidget {
  const AppWarningAlert({
    super.key,
    required this.contentText,
    this.icon,
    this.onAction,
    this.pop,
    this.iconColor,
    this.backgroundColor,
  });
  final String contentText;
  final VoidCallback? onAction;
  final VoidCallback? pop;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBaseDialog(
      backgroundColor: backgroundColor,
      actions: [
        if (context.isIos) ...[
          CupertinoDialogAction(
            onPressed: onAction ?? context.pop,
            child: const Text('Okay'),
          ),
          CupertinoDialogAction(
            onPressed: pop ?? context.pop,
            child: const Text('Cancel'),
          ),
        ],
        if (!context.isIos) ...[
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.appColors.success,
            ),
            onPressed: onAction ?? context.pop,
            child: const Text('Okay'),
          ),
          const HorizontalSpacingWidget(Sizes.p16),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.appColors.error,
            ),
            onPressed: pop ?? context.pop,
            child: const Text('Cancel'),
          ),
        ]
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDialogIcon(
            icon: icon ?? Icons.priority_high_rounded,
            color: iconColor ?? context.appColors.warning,
          ),
          const VerticalSpacingWidget(Sizes.p16),
          AppText(
            style: context.appTextTheme.bodyLarge!,
            text: contentText,
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
