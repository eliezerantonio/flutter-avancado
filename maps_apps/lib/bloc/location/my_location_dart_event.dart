part of 'my_location_dart_bloc.dart';

@immutable
abstract class MyLocationDartEvent {}

class OnLocationListener extends MyLocationDartEvent {
  final LatLng location;

  OnLocationListener(this.location);

  
}
