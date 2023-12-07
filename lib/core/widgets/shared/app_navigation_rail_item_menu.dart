import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

const double _menuWidth = 200.0;

class AppNavigationRailItemMenu extends StatelessWidget {
  const AppNavigationRailItemMenu({
    super.key,
    required this.isShowingOverlay,
    required this.removeOverlay,
    required this.navigationRailType,
  });
  final bool isShowingOverlay;
  final NavigationRailType navigationRailType;
  final void Function() removeOverlay;

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TapRegion(
          onTapOutside: (_) => removeOverlay(),
          child: LayoutBuilder(builder: (context, c) {
            return AppBorderedBox.withChild(
              width: _menuWidth,
              background: context.appColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MenuItem(
                    text: '+ Gestion de Credits',
                    onPressed: () {},
                  ),
                  _MenuItem(
                    text: '+ Gestion de Credits 2',
                    onPressed: () {},
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textStyle = const TextStyle().colorize(colors.onPrimary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            fixedSize: const Size(200, 25),
            alignment: Alignment.centerLeft,
          ),
          onPressed: onPressed,
          child: AppText(
            text: text,
            style: textStyle,
          ),
        ),
        const _Divider(),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.white.withOpacity(0.7),
        child: const IntrinsicWidth(
          child: SizedBox(
            width: _menuWidth - 25,
            height: 1,
          ),
        ),
      ),
    );
  }
}
