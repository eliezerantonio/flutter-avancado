import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrafficService {
  TrafficService._privateContructor();
  static final TrafficService _instance =
      new TrafficService._privateContructor();

  factory TrafficService() {
    return _instance;
  }
  final _dio = new Dio();

  Future getCoordsStartAndEnd( LatLng start, LatLng end, ){}
}

final trafficService = new TrafficService();
