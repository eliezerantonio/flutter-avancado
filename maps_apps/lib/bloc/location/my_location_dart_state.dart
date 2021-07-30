part of 'my_location_dart_bloc.dart';

@immutable
class MyLocationDartState {
  final bool following;
  final bool existLocation;
  final LatLng location;

  MyLocationDartState({
    this.following = true,
    this.existLocation = false,
    this.location,
  });

  MyLocationDartState copyWith({
    bool following,
    bool existLocation,
    LatLng location,
  }) =>
      new MyLocationDartState(
        existLocation: existLocation ?? this.existLocation,
        following: following ?? this.following,
        location: location ?? this.location,
      );
}
