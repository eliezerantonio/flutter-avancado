import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_apps/models/traffic_response.dart';

class TrafficService {
  TrafficService._privateContructor();
  static final TrafficService _instance =
      new TrafficService._privateContructor();

  factory TrafficService() {
    return _instance;
  }
  final _dio = new Dio();
 final _baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoiZWxpZXplcmF0b25pbyIsImEiOiJja3J3ZXN1b3AwZnVoMnZucW1rbTJxN3cwIn0.osSIHgWW6kkOlFf3rLsOlA';

  Future<DrivingResponse> getCoordsStartAndEnd(
    LatLng start,
    LatLng end,
  ) async {
     final coordString = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '${ this._baseUrl }/mapbox/driving/$coordString';

    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': true,
      'geometries': 'polyline6',
      'steps': false,
      'access_token': _apiKey,
      // 'lanuae': 'pt'

    });

    final data = DrivingResponse.fromJson(resp.data);
    return data;
  }
}

