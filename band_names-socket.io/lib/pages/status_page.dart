import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = context.watch<SocketService>();
    return Scaffold(
      body: Container(
        child: Text("ServerStatus: ${socketService.serverStatus}"),
      ),
    );
  }
}
