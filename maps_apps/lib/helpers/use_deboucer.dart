

// import 'dart:async';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void getSugerenciasPorQuery( String busqueda, LatLng proximidad ) {

//   debouncer.value = '';
//   debouncer.onValue = ( value ) async {
//     final resultados = await this.getResultadosPorQuery(value, proximidad);
//     this._sugerenciasStreamController.add(resultados);
//   };

//   final timer = Timer.periodic(Duration(milliseconds: 200), (_) {
//     debouncer.value = busqueda;
//   });

//   Future.delayed(Duration(milliseconds: 201)).then((_) => timer.cancel()); 

// }