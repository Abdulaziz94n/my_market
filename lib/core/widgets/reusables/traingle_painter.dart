import 'package:flutter/material.dart';
import 'package:my_market/core/theme/colors_palette.dart';

class TraingleWidget extends StatelessWidget {
  const TraingleWidget({
    super.key,
    this.paintingStyle = PaintingStyle.stroke,
    this.strokeWidth = 2,
    this.color = AppColorsPalette.primary,
    this.height,
    this.width,
    this.onTap,
  });
  final PaintingStyle paintingStyle;
  final Color color;
  final double strokeWidth;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: CustomPaint(
          painter: TrianglePainter(
            paintingStyle: paintingStyle,
            strokeWidth: strokeWidth,
            color: color,
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({
    this.color = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
