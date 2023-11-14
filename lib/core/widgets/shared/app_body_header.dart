import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_user_indicator.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

const Size _actionBtnSize = Size(36, 36);

class AppBodyHeader extends ConsumerWidget {
  const AppBodyHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: Sizes.p64,
      decoration: BoxDecoration(
          color: context.appColors.secondary.withOpacity(0.65),
          borderRadius: Sizes.defaultBorderRadius,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: context.appColors.black.withOpacity(0.2),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
            )
          ]),
      child: Row(
        children: [
          const HorizontalSpacingWidget(Sizes.p8),
          AppText(text: title),
          const Spacer(),
          const AppText(text: 'DateTime Goes Here'),
          const Spacer(),
          Row(
            children: [
              AppHeaderActionBtn(
                icon: Icons.add,
                onTap: () {},
              ),
              const HorizontalSpacingWidget(Sizes.p8),
              AppHeaderActionBtn(
                icon: Icons.notifications,
                onTap: () {},
              ),
              const HorizontalSpacingWidget(Sizes.p8),
              const AppUserIndicator(),
              const HorizontalSpacingWidget(Sizes.p8),
            ],
          )
        ],
      ),
    );
  }
}

class AppHeaderActionBtn extends StatelessWidget {
  const AppHeaderActionBtn({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AppBorderedBox.withIcon(
      boxShape: BoxShape.circle,
      onTap: onTap,
      height: _actionBtnSize.height,
      width: _actionBtnSize.width,
      icon: icon,
      iconColor: context.appColors.onBackground,
    );
  }
}
