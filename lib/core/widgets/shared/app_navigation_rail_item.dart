import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

const _kItemPadding = EdgeInsets.symmetric(vertical: Sizes.p20);

class AppNavigationRailItem extends StatefulWidget {
  const AppNavigationRailItem({
    super.key,
    required this.icon,
    required this.selectedItem,
    required this.onSelect,
    required this.type,
    required this.onEnter,
  });
  final IconData icon;
  final ValueChanged<NavigationRailType> onSelect;
  final NavigationRailType selectedItem;
  final NavigationRailType type;
  final void Function(
      PointerEnterEvent event, BuildContext context, Offset offset) onEnter;
  @override
  State<AppNavigationRailItem> createState() => _AppNavigationRailItemState();
}

class _AppNavigationRailItemState extends State<AppNavigationRailItem> {
  late RenderBox renderBox;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      renderBox = context.findRenderObject() as RenderBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => widget.onEnter(
        event,
        context,
        renderBox.localToGlobal(Offset.zero) +
            const Offset(Sizes.navigationRailWidth / 2 + 18, 0),
      ),
      child: Padding(
        padding: _kItemPadding,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: widget.selectedItem == widget.type
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
              onTap: () => widget.onSelect(widget.type),
              child: Icon(
                widget.icon,
                color: context.appColors.onPrimary,
                size: 38,
              ),
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
