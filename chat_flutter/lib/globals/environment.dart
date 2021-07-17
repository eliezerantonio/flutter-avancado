import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'localhost:3002/api/login/'
      : 'localhost:3002/api/login/';
}
