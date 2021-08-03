part of 'map_bloc.dart';

@immutable
class MapState {
  final bool listMap;
  final bool placeTraveled;

  final bool followLocation;
//Polylines
  final Map<String, Polyline> polylines;

  MapState({
    this.listMap = false,
    this.placeTraveled = true,
    this.followLocation = false,
    Map<String, Polyline> polylines,
  }) : this.polylines = polylines ?? new Map();

  copyWith({
    bool listMap,
    bool placeTraveled,
    bool followLocation,
    Map<String, Polyline> polylines,
  }) =>
      MapState(
        listMap: listMap ?? this.listMap,
        polylines: polylines ?? this.polylines,
        followLocation: followLocation ?? this.followLocation,
        placeTraveled: placeTraveled ?? this.placeTraveled,
      );
}
