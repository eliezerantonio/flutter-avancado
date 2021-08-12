part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnListMap extends MapEvent {}

class OnMarkTraveled extends MapEvent {}

class OnFollowLocation extends MapEvent {}

class OnLocationUpdate extends MapEvent {
  final LatLng location;

  OnLocationUpdate(this.location);
}

class OnMoveMap extends MapEvent {
  final LatLng centerMap;
  OnMoveMap(this.centerMap);
}

class OnCreateRouteInitDestine extends MapEvent {
  final List<LatLng> routes;
  final String destinationName;
  final double distance;
  final double duration;

  OnCreateRouteInitDestine(
    this.routes,
    this.distance,
    this.duration,
    this.destinationName,
  );
}
