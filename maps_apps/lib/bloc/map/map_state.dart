part of 'map_bloc.dart';

@immutable
class MapState {
  final bool listMap;
  final bool placeTraveled;
  final bool followLocation;

  final LatLng centralLocation;
//Polylines
  final Map<String, Polyline> polylines;

  MapState({
    this.listMap = false, 
    this.placeTraveled = false,
    this.followLocation = false,
    this.centralLocation,
    Map<String, Polyline> polylines,
  }) : this.polylines = polylines ?? new Map();

  copyWith({
    bool listMap,
    bool placeTraveled,
    bool followLocation,
    LatLng centralLocation,
    Map<String, Polyline> polylines,
  }) =>
      MapState(
        listMap: listMap ?? this.listMap,
        polylines: polylines ?? this.polylines,
        centralLocation: centralLocation ?? this.centralLocation,
        followLocation: followLocation ?? this.followLocation,
        placeTraveled: placeTraveled ?? this.placeTraveled,
      );
}
