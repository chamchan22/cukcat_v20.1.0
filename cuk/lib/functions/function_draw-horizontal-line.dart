import 'package:flutter/material.dart';

class DrawHorizontalLineFunction extends CustomPainter {
  Paint _paint;

  DrawHorizontalLineFunction() {
    _paint = Paint()
      ..color = Color(0XFFD8D8D8)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(10.0, 0.0), Offset(size.width, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}