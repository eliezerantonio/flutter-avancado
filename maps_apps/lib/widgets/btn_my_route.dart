part of 'widgets.dart';

class BtnMyRoute extends StatelessWidget {
  const BtnMyRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return CircleAvatar(
      backgroundColor: Colors.white,
      maxRadius: 25,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: IconButton(
          icon: Icon(Icons.edit),
          color: Colors.black87,
          onPressed: () {
            mapBloc.add(OnMarkTraveled());
          },
        ),
      ),
    );
  }
}
