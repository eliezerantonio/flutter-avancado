import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is OnActiveManualMarker) {
      yield state.copyWith(boolmanualSelected: true);
    } else if (event is OnDesactiveManualMarker) {
      yield state.copyWith(boolmanualSelected: false);
    }
  }
}
