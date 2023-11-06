import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

const _kItemPadding = EdgeInsets.symmetric(vertical: Sizes.p20);

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({
    super.key,
    required this.onSelect,
    required this.selectedItem,
  });
  final NavigationRailType selectedItem;
  final ValueChanged<NavigationRailType> onSelect;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: context.appColors.primary,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: SizedBox(
        width: Sizes.navigationRailWidth,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: Sizes.navigationRailMinHeight,
            ),
            child: SizedBox(
              height: context.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: _kItemPadding,
                        child: FlutterLogo(
                          size: 75,
                        ),
                      ),
                      AppNavigationRailItem(
                        icon: Icons.dashboard,
                        selectedItem: selectedItem,
                        type: NavigationRailType.dashboard,
                        onSelect: onSelect,
                      ),
                      AppNavigationRailItem(
                        icon: Icons.warehouse,
                        type: NavigationRailType.store,
                        selectedItem: selectedItem,
                        onSelect: onSelect,
                      ),
                      AppNavigationRailItem(
                        icon: Icons.groups_sharp,
                        type: NavigationRailType.users,
                        selectedItem: selectedItem,
                        onSelect: onSelect,
                      ),
                      AppNavigationRailItem(
                        icon: Icons.analytics,
                        type: NavigationRailType.reports,
                        selectedItem: selectedItem,
                        onSelect: onSelect,
                      ),
                      AppNavigationRailItem(
                        icon: Icons.people_alt_sharp,
                        type: NavigationRailType.clients,
                        selectedItem: selectedItem,
                        onSelect: onSelect,
                      ),
                      AppNavigationRailItem(
                        icon: Icons.shopping_cart,
                        type: NavigationRailType.orders,
                        selectedItem: selectedItem,
                        onSelect: onSelect,
                      ),
                    ],
                  ),
                  const ShutdownButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppNavigationRailItem extends StatelessWidget {
  const AppNavigationRailItem({
    super.key,
    required this.icon,
    required this.selectedItem,
    required this.onSelect,
    required this.type,
  });
  final IconData icon;
  final ValueChanged<NavigationRailType> onSelect;
  final NavigationRailType selectedItem;
  final NavigationRailType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _kItemPadding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: selectedItem == type
              ? [
                  BoxShadow(
                    color: context.appColors.grey.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () => onSelect(type),
            child: Icon(
              icon,
              color: context.appColors.onPrimary,
              size: Sizes.p48,
            ),
          ),
        ),
      ),
    );
  }
}

class ShutdownButton extends StatelessWidget {
  const ShutdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _kItemPadding * 2,
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.power_settings_new_outlined,
          color: context.appColors.onPrimary,
          size: Sizes.p48,
        ),
      ),
    );
  }
}
