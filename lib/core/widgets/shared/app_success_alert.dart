import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_market/core/widgets/reusables/app_base_dialog.dart';
import 'package:my_market/core/widgets/reusables/app_dialog_icon.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

import '../../extensions/build_context_extension.dart';
import '/core/constants/sizes.dart';
import 'app_text.dart';

class AppSuccessAlert extends StatelessWidget {
  const AppSuccessAlert({
    super.key,
    required this.contentText,
    this.pop,
    this.backgroundColor,
  });
  final String contentText;
  final VoidCallback? pop;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBaseDialog(
      backgroundColor: backgroundColor,
      actions: [
        if (context.isIos) ...[
          CupertinoDialogAction(
            onPressed: pop ?? context.pop,
            child: const Text('Okay'),
          ),
        ],
        if (!context.isIos) ...[
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.appColors.success,
            ),
            onPressed: pop ?? context.pop,
            child: const Text('Okay'),
          ),
        ]
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDialogIcon(
            icon: Icons.done,
            color: context.appColors.success,
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
