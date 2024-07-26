import 'package:flutter/material.dart';

class CircularProgressBarPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  CircularProgressBarPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double angle = 270 * 3.14 / 180; 
    double tiltAngle = 3.14 / 2;
    Rect rect = Offset(0, 0) & size;
    double startAngle =
        3.14 / 2;
    canvas.drawArc(rect, startAngle, angle, false, backgroundPaint);
    canvas.drawArc(rect, startAngle, progress * angle, false, progressPaint);
  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
