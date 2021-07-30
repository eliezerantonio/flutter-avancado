part of 'map_bloc.dart';

@immutable
class MapState {
  final bool listMap;

  MapState({this.listMap = false});

  copyWith({bool listMap}) => MapState(listMap: listMap ?? this.listMap);
}
