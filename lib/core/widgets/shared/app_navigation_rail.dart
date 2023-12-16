import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/mixins/overlay_mixin.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail_item.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail_item_menu.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

// TODO: Refactor [AppNavigationRailItem] map over enum ?

const _kItemPadding = EdgeInsets.symmetric(vertical: Sizes.p20);

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({
    super.key,
    required this.onRailSelect,
    required this.selectedRail,
    required this.onDestinationSelect,
    required this.selectedDestination,
  });
  final NavigationRailType selectedRail;
  final ValueChanged<NavigationRailType> onRailSelect;
  final RailDestination selectedDestination;
  final ValueChanged<RailDestination> onDestinationSelect;

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
                            selectedRail: widget.selectedRail,
                            type: NavigationRailType.dashboard,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
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
                            selectedRail: widget.selectedRail,
                            onSelect: widget.onRailSelect,
                            onEnter: (event, context, offset) {
                              if (isShowingOverlay) {
                                removeOverlay();
                              }
                              toggleOverlay(
                                child: AppNavigationRailItemMenu(
                                  onRailSelect: widget.onRailSelect,
                                  onDestinationSelect:
                                      widget.onDestinationSelect,
                                  selectedDestination:
                                      widget.selectedDestination,
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
