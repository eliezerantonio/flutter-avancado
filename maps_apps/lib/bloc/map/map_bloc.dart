import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_apps/themes/uber_map_theme.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(new MapState());

//map controller
  GoogleMapController _mapController;

  //Polylines

  Polyline _myRoute = new Polyline(
    polylineId: PolylineId('my_route'),
    width: 4,
  );

  void initMap(GoogleMapController controller) {
    if (!state.listMap) {
      this._mapController = controller;

      _mapController.setMapStyle(jsonEncode(uberMapTheme));
      add(OnListMap());
    }
  }

  void moveCamera(LatLng destination) {
    final cameraUpdate = CameraUpdate.newLatLng(destination);
    this._mapController?.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is OnListMap) {
      yield state.copyWith(listMap: true);
    } else if (event is OnLocationUpdate) {
      List<LatLng> points = [...this._myRoute.points, event.location];
      this._myRoute = this._myRoute.copyWith(pointsParam: points);

//guardando a poluline corrent
      final currentPolylines = state.polylines;
      currentPolylines['my_route']=this._myRoute;
    }
  }
}
