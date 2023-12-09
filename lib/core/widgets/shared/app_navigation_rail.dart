import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/mixins/overlay_mixin.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail_item.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail_item_menu.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

const _kItemPadding = EdgeInsets.symmetric(vertical: Sizes.p20);

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({
    super.key,
    required this.onSelect,
    required this.selectedItem,
  });
  final NavigationRailType selectedItem;
  final ValueChanged<NavigationRailType> onSelect;

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail>
    with OverlayMixin {
  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) {},
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: context.appColors.primary,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: SizedBox(
          width: Sizes.navigationRailWidth,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              scrollbars: false,
            ),
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
                            selectedItem: widget.selectedItem,
                            type: NavigationRailType.dashboard,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.dashboard,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.warehouse,
                            type: NavigationRailType.store,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.store,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.people_alt_sharp,
                            type: NavigationRailType.clients,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.clients,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.analytics,
                            type: NavigationRailType.reports,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.reports,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.groups_sharp,
                            type: NavigationRailType.users,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.users,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.shopping_cart,
                            type: NavigationRailType.cashier,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.cashier,
                                ),
                                offset: offset,
                              );
                            },
                          ),
                          AppNavigationRailItem(
                            icon: Icons.settings,
                            type: NavigationRailType.settings,
                            selectedItem: widget.selectedItem,
                            onSelect: widget.onSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  removeOverlay: removeOverlay,
                                  railType: NavigationRailType.settings,
                                ),
                                offset: offset,
                              );
                            },
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
        ),
      ),
    );
  }
}
