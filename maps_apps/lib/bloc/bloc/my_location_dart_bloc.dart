import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_location_dart_event.dart';
part 'my_location_dart_state.dart';

class MyLocationDartBloc extends Bloc<MyLocationDartEvent, MyLocationDartState> {
  MyLocationDartBloc() : super(MyLocationDartInitial());

  @override
  Stream<MyLocationDartState> mapEventToState(
    MyLocationDartEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
