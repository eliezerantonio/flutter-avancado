import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService extends ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  Socket _socket;
  SocketService() {
    this._initConfig();
  }

  _initConfig() {
    try {
      Socket socket = io(
          'http://localhost:3000',
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .disableAutoConnect() // disable auto-connection
              .setExtraHeaders({'foo': 'bar'}) // optional
              .build());
      socket.connect();
    } catch (e) {
      print(e);
    }
  }
}
