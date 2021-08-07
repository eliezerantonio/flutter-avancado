part of 'search_bloc.dart';

@immutable
class SearchState {
  final bool manualSelected;
  final List<SearchResult> history;

  SearchState({this.manualSelected = false, List<SearchResult> history})
      : this.history = (history == null) ? [] : history;

  copyWith({
    bool manualSelected,
    List<SearchResult> history,
  }) =>
      SearchState(
        manualSelected: manualSelected ?? this.manualSelected,
        history: history ?? this.history,
      );
}
