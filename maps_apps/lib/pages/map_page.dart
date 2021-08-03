import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_apps/bloc/location/my_location_dart_bloc.dart';
import 'package:maps_apps/bloc/map/map_bloc.dart';
import 'package:maps_apps/widgets/widgets.dart';

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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [BtnLocation(), BtnMyRoute(),],
      ),
    );
  }

  Widget createMap(MyLocationDartState state) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    if (!state.existLocation) return Center(child: Text("Buscando..."));
    mapBloc.add(OnLocationUpdate(state.location));
    final cameraPosition = new CameraPosition(target: state.location, zoom: 17);
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      onMapCreated: mapBloc.initMap,
      polylines: mapBloc.state.polylines.values.toSet(),
    );
  }
}
