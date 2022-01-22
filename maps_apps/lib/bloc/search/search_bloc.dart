import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maps_apps/models/search_result.dart';
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
      yield state.copyWith(manualSelected: true);
    } else if (event is OnDesactiveManualMarker) {
      yield state.copyWith(manualSelected: false);
    } else if (event is OnSaveHistorySearch) {
      final exist = state.history
          .where((result) =>
              result.nameDestination == event.result.nameDestination)
          .length;

      if (exist == 0) {
        final newHistorial = [...state.history, event.result];
        yield state.copyWith(history: newHistorial);
      }
    }
  }
}
