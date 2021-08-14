part of 'custom_markers.dart';

class MarkerDestination extends CustomPainter {
  final String description;
  final double metros;

  MarkerDestination(this.description, this.metros);

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
    path.moveTo(0, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(0, 100);

    canvas.drawShadow(path, Colors.black87, 10, false);

    //caixa branca
    final whiteBox = Rect.fromLTWH(0, 20, size.width - 10, 80);
    canvas.drawRect(whiteBox, paint);
//caixa preta
    paint.color = Colors.black;
    final blackBox = Rect.fromLTWH(0, 20, 70, 80);
    canvas.drawRect(blackBox, paint);

    //textos

    double kilometros = this.metros / 1000;
    kilometros = (kilometros * 100).floor().toDouble();
    kilometros = kilometros / 100;

    TextSpan textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      text: '$kilometros',
    );
    TextPainter textPainter = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        maxWidth: 70,
        minWidth: 70,
      );

    textPainter.paint(canvas, Offset(5, 35));

    //Minutos0
    textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      text: 'km',
    );
    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        maxWidth: 70,
      );
    textPainter.paint(canvas, Offset(20, 67));
    //My location

    textSpan = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      text: this.description,
    );
    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        maxLines: 2,
        ellipsis: '...')
      ..layout(
        maxWidth: size.width - 100,
      );
    textPainter.paint(canvas, Offset(90, 35));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {}
}
