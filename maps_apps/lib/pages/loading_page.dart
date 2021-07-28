import 'package:flutter/material.dart';
import 'package:maps_apps/helpers/helpers.dart';
import 'package:maps_apps/pages/map_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsAndLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }

  Future checkGpsAndLocation(BuildContext context) async {
    //TODO:Permisao gps
    //TODO:GPS esta activo

    await Future.delayed(Duration(milliseconds: 1000));

    Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
  }
}
