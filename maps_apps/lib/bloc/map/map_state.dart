part of 'map_bloc.dart';

@immutable
class MapState {
  final bool listMap;
  final bool placeTraveled;
//Polylines
  final Map<String, Polyline> polylines;
  
  MapState(
      {this.listMap = false,
      this.placeTraveled = true,
      Map<String, Polyline> polylines})
      : this.polylines = polylines ?? new Map();

  copyWith({
    bool listMap,
    bool placeTraveled,
  }) =>
      MapState(
        listMap: listMap ?? this.listMap,
        placeTraveled: placeTraveled ?? this.placeTraveled,
      );
}
