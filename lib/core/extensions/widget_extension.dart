import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget coloredPadded({Color? color, double? paddingVal}) => ColoredBox(
        color: color ?? Colors.yellow,
        child: Padding(
          padding: EdgeInsets.all(paddingVal ?? 4),
          child: this,
        ),
      );

  Widget paddedColored({Color? color, double? paddingVal}) => Padding(
        padding: EdgeInsets.all(paddingVal ?? 4),
        child: ColoredBox(
          color: color ?? Colors.red,
          child: this,
        ),
      );

  Widget colored({Color? color}) => ColoredBox(
        color: color ?? Colors.red,
        child: this,
      );

  List<Widget> operator *(int multiplier) {
    List<Widget> result = [];
    for (int i = 0; i < multiplier; i++) {
      result.add(this);
    }
    return result;
  }

  Widget padding({required EdgeInsets padding}) =>
      Padding(padding: padding, child: this);

  Widget align({Alignment? alignment, Alignment? webAlignment}) => kIsWeb
      ? Align(alignment: webAlignment ?? Alignment.centerLeft, child: this)
      : Align(alignment: alignment ?? Alignment.centerLeft, child: this);

  Widget get center => Center(child: this);

  Widget wrapWithEmptyChecker<T>(List<T> items, Widget isEmptyWidget) {
    return items.isEmpty ? isEmptyWidget : this;
  }
}
