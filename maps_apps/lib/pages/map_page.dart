import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_apps/bloc/bloc/my_location_dart_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    context.bloc<MyLocationDartBloc>().startSegment();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
