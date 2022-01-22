part of 'helpers.dart';

Future<BitmapDescriptor> getMarkerInceptionIcon(int seconds) async {
  final recorder = new ui.PictureRecorder();
  final canvas = new ui.Canvas(recorder);
  final size = new ui.Size(300, 150);
  final minutos = (seconds / 60).floor();
  final markerInception = new MarkerInceptionPainter(minutos);

  markerInception.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
}

Future<BitmapDescriptor> getMarkerDestinationIcon(
    String destinationName, double metros) async {
  final recorder = new ui.PictureRecorder();
  final canvas = new ui.Canvas(recorder);
  final size = new ui.Size(300, 150);
  final markerDestination = new MarkerDestination(destinationName, metros);

  markerDestination.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
}
