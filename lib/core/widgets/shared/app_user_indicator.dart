import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AppUserIndicator extends ConsumerWidget {
  const AppUserIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        AppBorderedBox.withIcon(
          boxShape: BoxShape.circle,
          width: 36,
          height: 36,
          icon: Icons.person,
          iconColor: context.appColors.onBackground,
        ),
        const HorizontalSpacingWidget(Sizes.p8),
        const AppText(text: 'User Name'),
      ],
    );
  }
}
