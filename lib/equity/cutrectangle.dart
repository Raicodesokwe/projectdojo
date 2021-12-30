import 'package:flutter/material.dart';

class CutRectangle extends CustomPainter {
  final Color color;
  CutRectangle(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color=color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.27, 0);

    canvas.drawPath(path,paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}
