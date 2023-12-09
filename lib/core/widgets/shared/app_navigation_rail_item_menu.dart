import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

// TODO: Refactor RemoveOverlay calls and widgets params, isLast

const double _menuWidth = 200.0;

class AppNavigationRailItemMenu extends StatelessWidget {
  const AppNavigationRailItemMenu({
    super.key,
    required this.removeOverlay,
    required this.railType,
  });
  final NavigationRailType railType;
  final void Function() removeOverlay;

  @override
  Widget build(BuildContext context) {
    return switch (railType) {
      NavigationRailType.dashboard => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'text 1',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
          ],
        ),
      NavigationRailType.store => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'Stocke et Produits',
              removeOverlay: removeOverlay,
            ),
            RailMenuItem(
              onPressed: () {},
              text: 'Stocke de la Perte',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
          ],
        ),
      NavigationRailType.clients => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'Gestion de Credits',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
            RailMenuItem(
              onPressed: () {},
              text: 'Facturation',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
            RailMenuItem(
              onPressed: () {},
              text: 'Historique de Reg',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.reports => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'text',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.users => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'text',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.cashier => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'text',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.settings => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              onPressed: () {},
              text: 'text',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
    };
  }
}

class NavigationRailSubMenu extends StatelessWidget {
  const NavigationRailSubMenu({
    super.key,
    required this.removeOverlay,
    required this.children,
  });

  final void Function() removeOverlay;
  final List<RailMenuItem> children;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TapRegion(
        onTapOutside: (_) => removeOverlay(),
        child: AppBorderedBox.withChild(
          width: _menuWidth,
          background: context.appColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

class RailMenuItem extends StatelessWidget {
  const RailMenuItem({
    super.key,
    required this.onPressed,
    required this.text,
    required this.removeOverlay,
    this.isLast = false,
  });

  final VoidCallback onPressed;
  final VoidCallback removeOverlay;
  final String text;
  final bool isLast;
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
          onPressed: () {
            onPressed();
            removeOverlay();
          },
          child: AppText(
            text: '+ $text',
            style: textStyle,
          ),
        ),
        if (!isLast) const _Divider(),
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
