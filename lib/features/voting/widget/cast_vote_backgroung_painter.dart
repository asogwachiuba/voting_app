import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class CastVoteBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define your custom background design using canvas.draw* methods
    // For example, draw a gradient background
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        ColorList.darkGreen,
        Colors.white,
        ColorList.darkGreen,
      ],
    );
    final backgroundPaint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // You can also draw custom shapes using Path and PathMetrics
    final path = Path();
    path.moveTo(0, size.height * 0.75);
    path.lineTo(size.width * 0.25, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.75);
    path.lineTo(size.width * 0.75, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    final pathPaint = Paint()..color = Colors.white.withOpacity(0.5);
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
