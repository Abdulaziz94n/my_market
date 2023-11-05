import 'package:flutter/material.dart';

class VerticalSpacingWidget extends StatelessWidget {
  const VerticalSpacingWidget(this.space, {Key? key}) : super(key: key);
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HorizontalSpacingWidget extends StatelessWidget {
  const HorizontalSpacingWidget(this.space, {Key? key}) : super(key: key);
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
