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
