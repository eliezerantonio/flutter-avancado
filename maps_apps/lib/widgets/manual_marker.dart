part of 'widgets.dart';

class ManualMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state.manualSelected) {
        return _BuildManualMarker();
      } else {
        return Container();
      }
    });
  }
}

class _BuildManualMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        //botao regressar
        Positioned(
          top: 40,
          left: 20,
          child: FadeInLeft(
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black87,
                onPressed: () {
                  context.bloc<SearchBloc>().add(OnDesactiveManualMarker());
                },
              ),
            ),
          ),
        ),

        Center(
          child: Transform.translate(
            offset: Offset(0, -20),
            child: BounceInDown(
              from: 200,
              child: Icon(
                Icons.location_on,
                size: 50,
              ),
            ),
          ),
        ),

        //botao confirmar destino
        Positioned(
          bottom: 70,
          left: 40,
          child: FadeIn(
            child: MaterialButton(
                minWidth: width - 120,
                child: Text("Confirmar destino",
                    style: TextStyle(color: Colors.white)),
                color: Colors.black,
                shape: StadiumBorder(),
                splashColor: Colors.transparent,
                onPressed: () {
                  this.calculateDestine(context);
                }),
          ),
        )
      ],
    );
  }

  void calculateDestine(BuildContext context) async {
    calculatingAlert(context);

    final mapBloc = context.bloc<MapBloc>();
    final inception = context.bloc<MyLocationDartBloc>().state.location;
    final trafficService = new TrafficService();
    final destination = mapBloc.state.centralLocation;

    final reserveQueryResponse =
        await trafficService.getCoordernadasInfo(destination);
//obter infomacao destino
    final trafficResponse =
        await trafficService.getCoordsStartAndEnd(inception, destination);

    final geometry = trafficResponse.routes[0].geometry;
    final duration = trafficResponse.routes[0].duration;
    final distance = trafficResponse.routes[0].distance;
    final destinatioName = reserveQueryResponse.features[0].placeName;
    //decodificar pontos geometricos
    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6)
        .decodedCoords;
    final List<LatLng> coordsList =
        points.map((point) => LatLng(point[0], point[1])).toList();

    mapBloc.add(OnCreateRouteInitDestine(
        coordsList, distance, duration, destinatioName));
    Navigator.of(context).pop();
    context.bloc<SearchBloc>().add(OnDesactiveManualMarker());
  }
}
