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
          top: 70,
          left: 20,
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

        Center(
          child: Transform.translate(
            offset: Offset(0, -12),
            child: Icon(
              Icons.location_on,
              size: 50,
            ),
          ),
        ),

        //botao confirmar destino
        Positioned(
          bottom: 70,
          left: 40,
          child: MaterialButton(
              minWidth: width - 120,
              child: Text("Confirmar destino",
                  style: TextStyle(color: Colors.white)),
              color: Colors.black,
              shape: StadiumBorder(),
              splashColor: Colors.transparent,
              onPressed: () {
                //TODO:fazer algo!!!
              }),
        )
      ],
    );
  }
}
