import 'package:flutter/material.dart';

class DrawDottedhorizontalline extends CustomPainter {
  Paint? _paint;
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint!.color = Colors.black; //dots color
    _paint!.strokeWidth = 1; //dots thickness
    _paint!.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -100; i < 100; i = i + 15) {
      // 15 is space between dots
      if (i % 2 == 0)
        canvas.drawLine(Offset(0.0, i), Offset(0.0, i + 10), _paint!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
