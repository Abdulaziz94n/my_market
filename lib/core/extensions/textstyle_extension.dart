import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get withShadow => copyWith(shadows: [
        const BoxShadow(
          blurRadius: 5,
          offset: Offset(0, 0),
          color: Colors.white30,
          spreadRadius: 15,
        )
      ]);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle colorize(Color color) => copyWith(color: color);
}
