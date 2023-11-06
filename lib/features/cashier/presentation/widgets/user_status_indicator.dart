import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class UserStatusIndicator extends StatelessWidget {
  const UserStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: context.appColors.success,
        ),
        const HorizontalSpacingWidget(Sizes.p8),
        AppText(
          text: 'Active',
          style: TextStyle(color: context.appColors.success),
        )
      ],
    );
  }
}
