import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Geolocator.getPositionStream();
    return Scaffold(
      body: Center(
        child: Text("Mapa"),
      ),
    );
  }
}
