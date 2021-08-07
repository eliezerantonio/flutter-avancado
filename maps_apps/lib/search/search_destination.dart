import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:maps_apps/models/search_response.dart';
import 'package:maps_apps/models/search_result.dart';
import 'package:maps_apps/services/traffic_service.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;
  final LatLng proximidad;
  SearchDestination(this.proximidad)
      : this.searchFieldLabel = 'Buscar...',
        this._trafficService = new TrafficService();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => this.query = '',
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    final searchResult = SearchResult(cancel: true);
    return IconButton(
      onPressed: () => this.close(context, searchResult),
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _contructorResultSugestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text(
            'Definir Localizacao Manualmente',
          ),
          onTap: () {
            this.close(context, SearchResult(cancel: false, manual: true));
          },
        )
      ],
    );
  }

  Widget _contructorResultSugestions() {
    return FutureBuilder<SearchResponse>(
      future:
          this._trafficService.getResultForQuery(this.query.trim(), proximidad),
      builder: (BuildContext context, AsyncSnapshot<SearchResponse> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final places = snapshot.data.features;

        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final place = places[index];
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(place.textPt),
              subtitle: Text(place.placeNamePt),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: places.length,
        );
      },
    );
  }
}
