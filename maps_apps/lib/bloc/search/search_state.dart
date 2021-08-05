part of 'search_bloc.dart';

@immutable
class SearchState {
  final bool manualSelected;

  SearchState({
    this.manualSelected = false,
  });

  copyWith({boolmanualSelected}) =>
      SearchState(manualSelected: manualSelected ?? this.manualSelected);
}
