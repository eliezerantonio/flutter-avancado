import 'package:flutter/material.dart';
import 'package:maps_apps/custom_markers/marker_inception.dart';

class TestMarkerPage extends StatelessWidget {
  const TestMarkerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 350,
            height: 150,
            color: Colors.red,
            child: CustomPaint(
              painter: MarkerInceptionPainter(250),
            )),
      ),
    );
  }
}
