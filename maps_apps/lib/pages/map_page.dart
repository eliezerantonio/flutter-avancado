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
    context.bloc<MyLocationDartBloc>().canceledSegment();
  }

  @override
  Widget build(BuildContext context) {
    Geolocator.getPositionStream();
    return Scaffold(
      body: BlocBuilder<MyLocationDartBloc, MyLocationDartState>(
          builder: (context, state) => createMap(state)),
    );
  }

  Widget createMap(MyLocationDartState state) {
    if (!state.existLocation) return Center(child: Text("Buscando..."));

    return Text("${state.location.latitude}${state.location.longitude}");
  }
}
