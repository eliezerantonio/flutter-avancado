import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_apps/pages/access_gps_page.dart';
import 'package:maps_apps/pages/loading_page.dart';
import 'package:maps_apps/pages/map_page.dart';

import 'bloc/location/my_location_dart_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => MyLocationDartBloc(),),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'loading',
        routes: {
          'map': (_) => MapPage(),
          'loading': (_) => LoadingPage(),
          'access_gps': (_) => AccessGpsPage(),
        },
      ),
    );
  }
}
