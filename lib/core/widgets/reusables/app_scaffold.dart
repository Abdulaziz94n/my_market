import 'package:flutter/material.dart';
import 'package:my_market/core/theme/colors_palette.dart';
import 'package:my_market/core/utils/assets_manager.dart';
import 'package:my_market/core/widgets/shared/app_background_shape.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.withBackgroundShape = true,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool withBackgroundShape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorsPalette.imageBackground,
        image: DecorationImage(
          image: AssetImage(AppAssets.bgImage),
          fit: BoxFit.contain,
          repeat: ImageRepeat.repeat,
          opacity: 0.15,
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: body,
            floatingActionButton: floatingActionButton,
          ),
          if (withBackgroundShape) const BackgroundShape(),
        ],
      ),
    );
  }
}
