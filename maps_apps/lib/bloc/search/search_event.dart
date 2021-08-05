part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class OnActiveManualMarker extends SearchEvent {}

class OnDesactiveManualMarker extends SearchEvent {}
