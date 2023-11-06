import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/theme/colors_palette.dart';

class BackgroundShape extends StatelessWidget {
  const BackgroundShape({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: CustomPaint(
        size: Size(context.screenWidth, context.screenHeight),
        painter: BackgroundShapePainter(),
      ),
    );
  }
}

class BackgroundShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    final paint = Paint()
      ..color = AppColorsPalette.background.withOpacity(0.2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    path.lineTo(width * 0.30, height * 0.70);
    path.lineTo(width * 0.50, height * 0.80);
    path.lineTo(width * 0.50, height * 0.80);
    path.lineTo(width * 0.70, height * 0.70);
    path.lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
