part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.manualSelected) {
          return Container();
        } else {
          return FadeInDown(
            duration: Duration(milliseconds: 300),
            child: buildSearchBar(context),
          );
        }
      },
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        child: GestureDetector(
          onTap: () async {
            final proximidad =
                context.bloc<MyLocationDartBloc>().state.location;
            final history = context.bloc<SearchBloc>().state.history;

            final SearchResult result = await showSearch(
              context: context,
              delegate: SearchDestination(proximidad, history),
            );
            searchReturn(context, result);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Text(
              "Onde pretende ir ?",
            ),
          ),
        ),
      ),
    );
  }

  Future<void> searchReturn(
      BuildContext context, SearchResult searchResult) async {
    print(searchResult.manual);
    if (searchResult.cancel) return;

    if (searchResult.manual) {
      context.bloc<SearchBloc>().add(OnActiveManualMarker());
      return;
    }
    //calculcar a rota com base ao valor: Result;

    final trafficService = new TrafficService();
    final mapBloc = context.bloc<MapBloc>();
    final inception = context.bloc<MyLocationDartBloc>().state.location;
    final destination = searchResult.position;

    final drivingResponse =
        await trafficService.getCoordsStartAndEnd(inception, destination);
    final geometry = drivingResponse.routes[0].geometry;
    final duration = drivingResponse.routes[0].duration;
    final distance = drivingResponse.routes[0].distance;

    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6);

    final List<LatLng> routeCoodenads = points.decodedCoords
        .map((point) => LatLng(point[0], point[1]))
        .toList();

    // mapBloc.add(OnCreateRouteInitDestine(routeCoodenads, distance, duration));

    // Navigator.of(context).pop();

    //salvar histial

    final searchBloc = context.bloc<SearchBloc>();
  
    searchBloc.add(OnSaveHistorySearch(searchResult));

  }
}
