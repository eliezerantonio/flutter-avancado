import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:maps_apps/helpers/helpers.dart';
import 'package:maps_apps/pages/access_gps_page.dart';
import 'package:maps_apps/pages/map_page.dart';
import 'package:permission_handler/permission_handler.dart';

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
    final permissionGPS = await Permission.location.isGranted;
    final gpsActivo = Geolocator().is
    

    await Future.delayed(Duration(milliseconds: 100));

    Navigator.pushReplacement(
        context, navegarMapFadeIn(context, AccessGpsPage()));
    // Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
  }
}
