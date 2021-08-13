import 'package:flutter/material.dart';

class MarkerInceptionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double blackCircleNegroR = 20;
    final double whiteCircleNegroR = 7;

    Paint paint = new Paint();
    paint.color = Colors.black;

    //Desenhar um circulo negro

    canvas.drawCircle(
        Offset(blackCircleNegroR, size.height - blackCircleNegroR), 20, paint);

    //ciculo branco
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(blackCircleNegroR, size.height - whiteCircleNegroR), 7, paint);
  }

  @override
  bool shouldRepaint(MarkerInceptionPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MarkerInceptionPainter oldDelegate) => false;
}
