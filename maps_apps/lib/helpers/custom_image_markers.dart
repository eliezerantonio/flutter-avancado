part of 'helpers.dart';

Future<BitmapDescriptor> getassetImageMarker() async {
  return await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(devicePixelRatio: 2.5),
    'assets/custom-pin.png',
  );
}

Future<BitmapDescriptor> getNetworkImageMarker() async {
  final resp = await Dio().get(
      'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/map-marker-512.png');

      
}
