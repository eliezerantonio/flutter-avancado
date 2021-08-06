import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_apps/models/search_response.dart';
import 'package:maps_apps/models/traffic_response.dart';

class TrafficService {
  TrafficService._privateContructor();
  static final TrafficService _instance =
      new TrafficService._privateContructor();

  factory TrafficService() {
    return _instance;
  }
  final _dio = new Dio();
  final _baseUrlDir = 'https://api.mapbox.com/directions/v5';
  final _baseUrlGeo = 'https://api.mapbox.com/geocoding/v5';
  final _apiKey =
      'pk.eyJ1IjoiZWxpZXplcmF0b25pbyIsImEiOiJja3J3ZXN1b3AwZnVoMnZucW1rbTJxN3cwIn0.osSIHgWW6kkOlFf3rLsOlA';

  Future<DrivingResponse> getCoordsStartAndEnd(
    LatLng start,
    LatLng end,
  ) async {
    final coordString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '${this._baseUrlDir}/mapbox/driving/$coordString';

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

  Future getResultForQuery(String search, LatLng proximity) async {
    final url = '${this._baseUrlGeo}/mapbox.places/$search.json';
    final resp = await this._dio.get(url, queryParameters: {
      'access_token': true,
      'autocomplete': true,
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'language': 'pt',
    });

    final searchResponse = searchResponseFromJson(resp.data);

    return searchResponse;
  }
}
