import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/widgets/shared/app_body_header.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AppMainBody extends StatelessWidget {
  const AppMainBody({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.defaultBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBodyHeader(),
          const VerticalSpacingWidget(Sizes.p24),
          ...children,
        ],
      ),
    );
  }
}
