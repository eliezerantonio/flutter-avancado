import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:maps_apps/helpers/helpers.dart';
import 'package:maps_apps/pages/access_gps_page.dart';
import 'package:maps_apps/pages/map_page.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacementNamed(
            context, navegarMapFadeIn(context, MapPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsAndLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data));
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }

  Future checkGpsAndLocation(BuildContext context) async {
    final permissionGPS = await Permission.location.isGranted;
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permissionGPS && gpsActivo) {
      Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
      return '';
    } else if (!permissionGPS) {
      Navigator.pushReplacement(
          context, navegarMapFadeIn(context, AccessGpsPage()));
      return ' Precisa de permissao gps';
    } else if (gpsActivo) {
      return 'Active o Gps';
    }

    Navigator.pushReplacement(
        context, navegarMapFadeIn(context, AccessGpsPage()));
    // Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
  }
}
