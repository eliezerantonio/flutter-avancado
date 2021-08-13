import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_apps/custom_markers/custom_markers.dart';
import 'package:maps_apps/helpers/helpers.dart';
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

    final currentPolylines = state.polylines;
    currentPolylines['my_route_destine'] = this._myRouteDestine;

    // final icon = await getassetImageMarker();
    final iconInception = await getMarkerInceptionIcon(event.duration.toInt());
    final iconDestination =
        await getMarkerDestinationIcon(event.destinationName, event.distance);

//markers
    final markerInception = new Marker(
      markerId: MarkerId('inception'),
      position: event.routes[0],
      icon: iconInception,
      anchor: Offset(0.0, 1.0),
      infoWindow: InfoWindow(
        title: 'Minha Localizacao',
        snippet: 'Duracao recorrida:${event.duration / 60.floor()} minutos',
      ),
    ); //markers

    double kms = event.distance / 1000;
    kms = (kms * 100).floor().toDouble();
    kms = kms / 100;

    final markerDestination = new Marker(
      markerId: MarkerId('destination'),
      position: event.routes[event.routes.length - 1],
      icon: iconDestination,
      anchor: Offset(0.1, 0.90),
      infoWindow: InfoWindow(
        title: event.destinationName,
        snippet: 'Distancia: $kms km',
      ),
    );

    final newMarkers = {...state.markers};
    newMarkers['inception'] = markerInception;
    newMarkers['destination'] = markerDestination;
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      _mapController.showMarkerInfoWindow(MarkerId('inception'));
      _mapController.showMarkerInfoWindow(MarkerId('destination'));
    });

    yield state.copyWith(
      polylines: currentPolylines,
      markers: newMarkers,
    );
  }
}
