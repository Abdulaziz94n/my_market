import 'dart:math';

import 'package:flutter/material.dart';

class BorderedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double percentage;
  final bool? showDiameter;

  BorderedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.percentage,
    this.showDiameter = false,
  }) : assert(percentage >= 0 && percentage <= 100);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * percentage / 100;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      showDiameter ?? true,
      paint,
    );
  }

  @override
  bool shouldRepaint(BorderedCirclePainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        percentage != oldDelegate.percentage;
  }
}

class CircleBorder extends StatelessWidget {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double percentage;
  final bool? showDiameter;

  const CircleBorder({
    super.key,
    required this.color,
    required this.radius,
    this.showDiameter = false,
    this.strokeWidth = 2.0,
    this.percentage = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BorderedCirclePainter(
        color: color,
        strokeWidth: strokeWidth,
        percentage: percentage,
        showDiameter: showDiameter,
      ),
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }
}
