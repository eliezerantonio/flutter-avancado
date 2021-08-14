part of 'custom_markers.dart';
class MarkerInceptionPainter extends CustomPainter {
  final int minutos;
  MarkerInceptionPainter(this.minutos);

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
        Offset(blackCircleNegroR, size.height - blackCircleNegroR),
        whiteCircleNegroR,
        paint);

    //Sombra

    final Path path = new Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);

    canvas.drawShadow(path, Colors.black87, 10, false);

    //caixa branca
    final whiteBox = Rect.fromLTWH(40, 20, size.width - 55, 80);
    canvas.drawRect(whiteBox, paint);
//caixa preta
    paint.color = Colors.black;
    final blackBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blackBox, paint);

    //textos
    TextSpan textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
      text: '$minutos',
    );
    TextPainter textPainter = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        maxWidth: 70,
        minWidth: 70,
      );

    textPainter.paint(canvas, Offset(40, 35));

    //Minutos0
    textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      text: 'min',
    );
    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        maxWidth: 70,
        minWidth: 70,
      );
    textPainter.paint(canvas, Offset(40, 67));
    //My location

    textSpan = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      text: 'Minha localização',
    );
    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        maxWidth: size.width - 130,
      );
    textPainter.paint(canvas, Offset(120, 50));
  }

  @override
  bool shouldRepaint(MarkerInceptionPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MarkerInceptionPainter oldDelegate) => false;
}
