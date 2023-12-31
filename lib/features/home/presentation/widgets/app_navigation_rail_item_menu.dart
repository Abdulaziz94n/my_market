import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

// TODO: Refactor RemoveOverlay calls and widgets params, isLast

const double _menuWidth = 200.0;

class AppNavigationRailItemMenu extends StatelessWidget {
  const AppNavigationRailItemMenu({
    super.key,
    required this.removeOverlay,
    required this.railType,
    required this.selectedDestination,
    required this.onDestinationSelect,
    required this.onRailSelect,
  });
  final NavigationRailType railType;
  final void Function() removeOverlay;
  final RailDestination selectedDestination;
  final ValueChanged<RailDestination> onDestinationSelect;
  final ValueChanged<NavigationRailType> onRailSelect;

  @override
  Widget build(BuildContext context) {
    return switch (railType) {
      NavigationRailType.dashboard => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              railType: NavigationRailType.dashboard,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.dashboard,
              onDestinationSelect: onDestinationSelect,
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
              railType: NavigationRailType.store,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.stockProduct,
              onDestinationSelect: onDestinationSelect,
              text: 'Stocke et Produits',
              removeOverlay: removeOverlay,
            ),
            RailMenuItem(
              railType: NavigationRailType.store,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.stockPerte,
              onDestinationSelect: onDestinationSelect,
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
              railType: NavigationRailType.clients,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.clientsOnCredit,
              onDestinationSelect: onDestinationSelect,
              text: 'Gestion de Credits',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
            RailMenuItem(
              railType: NavigationRailType.clients,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.clientsCompany,
              onDestinationSelect: onDestinationSelect,
              text: 'Facturation',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
            RailMenuItem(
              railType: NavigationRailType.clients,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.clientsHistory,
              onDestinationSelect: onDestinationSelect,
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
              railType: NavigationRailType.reports,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.reports,
              onDestinationSelect: onDestinationSelect,
              text: 'reports',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.users => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              railType: NavigationRailType.users,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.users,
              onDestinationSelect: onDestinationSelect,
              text: 'users',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
            RailMenuItem(
              railType: NavigationRailType.users,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.oldUsers,
              onDestinationSelect: onDestinationSelect,
              text: 'old users',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
          ],
        ),
      NavigationRailType.cashier => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              railType: NavigationRailType.cashier,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.cashier,
              onDestinationSelect: onDestinationSelect,
              text: 'cashier',
              removeOverlay: removeOverlay,
              isLast: true,
            )
          ],
        ),
      NavigationRailType.settings => NavigationRailSubMenu(
          removeOverlay: removeOverlay,
          children: [
            RailMenuItem(
              railType: NavigationRailType.settings,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.barCodeGen,
              onDestinationSelect: onDestinationSelect,
              text: 'Gene Codes-Barres',
              removeOverlay: removeOverlay,
            ),
            RailMenuItem(
              railType: NavigationRailType.settings,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.authorizations,
              onDestinationSelect: onDestinationSelect,
              text: 'Autorisations',
              removeOverlay: removeOverlay,
            ),
            RailMenuItem(
              railType: NavigationRailType.settings,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.tickets,
              onDestinationSelect: onDestinationSelect,
              text: 'Pers des ticketes',
              removeOverlay: removeOverlay,
            ),
            RailMenuItem(
              railType: NavigationRailType.settings,
              onRailSelect: onRailSelect,
              selectedDestination: selectedDestination,
              railDestination: RailDestination.categories,
              onDestinationSelect: onDestinationSelect,
              text: 'Gest des Familles',
              removeOverlay: removeOverlay,
              isLast: true,
            ),
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
    required this.text,
    required this.removeOverlay,
    required this.railDestination,
    required this.onDestinationSelect,
    required this.selectedDestination,
    required this.onRailSelect,
    required this.railType,
    this.isLast = false,
  });

  final VoidCallback removeOverlay;
  final String text;
  final bool isLast;
  final RailDestination railDestination;
  final RailDestination selectedDestination;
  final ValueChanged<RailDestination> onDestinationSelect;
  final NavigationRailType railType;
  final ValueChanged<NavigationRailType> onRailSelect;

  @override
  Widget build(BuildContext context) {
    final isSelected = railDestination == selectedDestination;
    final colors = context.appColors;
    final textStyle = const TextStyle()
        .colorize(isSelected ? colors.error : colors.onPrimary);

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
            onDestinationSelect(railDestination);
            onRailSelect(railType);
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
