part of 'map_bloc.dart';

@immutable
class MapState {
  final bool listMap;
  final bool placeTraveled;
  final bool followLocation;

  final LatLng centralLocation;
//Polylines
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  MapState({
    this.listMap = false,
    this.placeTraveled = false,
    this.followLocation = false,
    this.centralLocation,
    Map<String, Marker> markers,
    Map<String, Polyline> polylines,
  })  : this.polylines = polylines ?? new Map(),
        this.markers = markers ?? new Map();

  copyWith({
    bool listMap,
    bool placeTraveled,
    bool followLocation,
    LatLng centralLocation,
    Map<String, Polyline> polylines,
    Map<String, Marker> markers,
  }) =>
      MapState(
        listMap: listMap ?? this.listMap,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
        centralLocation: centralLocation ?? this.centralLocation,
        followLocation: followLocation ?? this.followLocation,
        placeTraveled: placeTraveled ?? this.placeTraveled,
      );
}
