part of 'widgets.dart';

class BtnFollowLocation extends StatelessWidget {
  const BtnFollowLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 25,
            child: IconButton(
              icon: Icon(
                state.followLocation
                    ? Icons.directions_run
                    : Icons.accessibility_new,
              ),
              color: Colors.black87,
              onPressed: () {
                mapBloc.add(OnFollowLocation());
              },
            ),
          ),
        );
      },
    );
  }
}
