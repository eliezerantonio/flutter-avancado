import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng, latLng;
import 'package:meta/meta.dart';

part 'my_location_dart_event.dart';
part 'my_location_dart_state.dart';

class MyLocationDartBloc
    extends Bloc<MyLocationDartEvent, MyLocationDartState> {
  MyLocationDartBloc() : super(MyLocationDartState());

  void startSegment() {
    Geolocator.getPositionStream(
            desiredAccuracy: Geolocator.LocationAccuracy.high,
            distanceFilter: 10)
        .listen((position) {
      print(position);
    });
  }

  @override
  Stream<MyLocationDartState> mapEventToState(
    MyLocationDartEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
