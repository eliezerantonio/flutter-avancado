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
  final baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoiZWxpZXplcmF0b25pbyIsImEiOiJja3J3ZXN1b3AwZnVoMnZucW1rbTJxN3cwIn0.osSIHgWW6kkOlFf3rLsOlA';

  Future getCoordsStartAndEnd(
    LatLng start,
    LatLng end,
  ) async {
    final coordsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude},';
    final url = ' ${this.baseUrl}/mapbox/driving/$coordsString';
    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': false,
      'access_token': _apiKey,
      // 'lanuae': 'pt'
    });

    print(resp);
    return;
  }
}

final trafficService = new TrafficService();
