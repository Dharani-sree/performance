import 'package:flutter/material.dart';
import 'package:machine_performance/common/arc_progress_bar/custom_paint.dart';

class ArcProgressBar extends StatelessWidget {
  final double? progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  ArcProgressBar({
    required this.progress,
    this.strokeWidth = 8.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    String percentageText = '${(progress! * 100).toInt()}%';
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: RotationTransition(
            turns: new AlwaysStoppedAnimation(45 / 360),
            child: CustomPaint(
              size: const Size(75, 75),
              painter: CircularProgressBarPainter(
                progress: progress!,
                strokeWidth: strokeWidth,
                backgroundColor: backgroundColor,
                progressColor: progressColor,
              ),
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 25,
            child: Text(
              percentageText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
