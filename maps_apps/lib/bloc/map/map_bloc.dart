import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Colors;
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
      polylineId: PolylineId('my_route'), width: 4, color: Colors.transparent);

  Polyline _myRouteDestine = new Polyline(
      polylineId: PolylineId('my_route_destine'),
      width: 4,
      color: Colors.black87);

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
      yield* this._onLocationUpdate(
          event); // nao etou a regresar o stream estou a regresar a emisao do stream
    } else if (event is OnMarkTraveled) {
      yield* this._onMarkTraveled(event);
    } else if (event is OnFollowLocation) {
      yield* this._onFollowLocation(event);
    } else if (event is OnMoveMap) {
      yield state.copyWith(centralLocation: event.centerMap);
    } else if (event is OnCreateRouteInitDestine) {
      yield* this._onCreateRouteInitDestine(event);
    }
  }

  Stream<MapState> _onLocationUpdate(OnLocationUpdate event) async* {
    if (state.followLocation) {
      this.moveCamera(event.location);
    }
    List<LatLng> points = [...this._myRoute.points, event.location];
    this._myRoute = this._myRoute.copyWith(pointsParam: points);

//guardando a poluline corrent
    final currentPolylines = state.polylines;
    currentPolylines['my_route'] = this._myRoute;

    //emitirr novo estado

    yield state.copyWith(polylines: currentPolylines);
  }

  Stream<MapState> _onMarkTraveled(OnMarkTraveled event) async* {
    if (!state.placeTraveled) {
      this._myRoute = this._myRoute.copyWith(colorParam: Colors.black87);
    } else {
      this._myRoute = this._myRoute.copyWith(colorParam: Colors.transparent);
    }

    final currentPolylines = state.polylines;
    currentPolylines['my_route'] = this._myRoute;

    yield state.copyWith(
      placeTraveled: !state.placeTraveled,
      polylines: currentPolylines,
    );
  }

  Stream<MapState> _onFollowLocation(OnFollowLocation event) async* {
    if (!state.followLocation) {
      this.moveCamera(this._myRoute.points[this._myRoute.points.length - 1]);
    }
    yield state.copyWith(followLocation: !state.followLocation);
  }

  Stream<MapState> _onCreateRouteInitDestine(
      OnCreateRouteInitDestine event) async* {
    this._myRouteDestine =
        this._myRouteDestine.copyWith(pointsParam: event.routes);
    yield state.copyWith();
  }
}
