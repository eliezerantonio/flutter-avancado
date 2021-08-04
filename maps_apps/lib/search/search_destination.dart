import 'package:flutter/material.dart';
import 'package:maps_apps/models/search_result.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  SearchDestination() : this.searchFieldLabel = 'Buscar...';
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
    return Text("");
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
            print("Manuelamente");
            this.close(context, SearchResult(cancel: false, manual: true));
          },
        )
      ],
    );
  }
}
