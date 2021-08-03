part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnListMap extends MapEvent {}

class OnLocationUpdate extends MapEvent {
  final LatLng location;

  OnLocationUpdate(this.location);
}

class OnMarkTraveled extends MapEvent {}

class OnFollowLocation extends MapEvent {}
