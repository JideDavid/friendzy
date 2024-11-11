import 'dart:math';

import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';


class RadialProgressIndicator extends StatelessWidget {
  final double progress; //

  RadialProgressIndicator({required this.progress,});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200), // Size of the progress indicator
      painter: RadialProgressPainter(progress),
    );
  }
}

class RadialProgressPainter extends CustomPainter {
  final double progress;

  RadialProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const strokeWidth = 20.0;

    // Draw background circle (full circle)
    final backgroundPaint = Paint()
      ..color = TColors.buttonSecondary.withOpacity(0.5)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = TColors.buttonSecondary
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Makes the edges of the progress round

    const startAngle = -pi / 2; // Start at the top
    final sweepAngle = 2 * pi * progress; // Calculate the progress in radians
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}