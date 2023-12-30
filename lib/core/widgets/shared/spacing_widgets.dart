import 'package:flutter/material.dart';

class VerticalSpacingWidget extends StatelessWidget {
  const VerticalSpacingWidget(this.space, {super.key});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HorizontalSpacingWidget extends StatelessWidget {
  const HorizontalSpacingWidget(this.space, {super.key});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
