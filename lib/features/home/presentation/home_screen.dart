import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/theme/colors_palette.dart';
import 'package:my_market/core/widgets/shared/app_background_shape.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColorsPalette.imageBackground,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Builder(builder: (context) {
              final selectedRail = ValueNotifier(NavigationRailType.dashboard);
              return ValueListenableBuilder(
                  valueListenable: selectedRail,
                  builder: (context, val, child) {
                    return Row(
                      children: [
                        AppNavigationRail(
                          selectedItem: selectedRail.value,
                          onSelect: (value) => selectedRail.value = value,
                        ),
                        Expanded(
                          child: HomeBody(selectedRail: selectedRail.value),
                        )
                      ],
                    );
                  });
            }),
          ),
          const BackgroundShape()
        ],
      ),
    );
  }
}
