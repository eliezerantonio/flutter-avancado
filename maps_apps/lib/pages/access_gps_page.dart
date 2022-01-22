import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessGpsPage extends StatefulWidget {
  const AccessGpsPage({Key key}) : super(key: key);

  @override
  _AccessGpsPageState createState() => _AccessGpsPageState();
}

class _AccessGpsPageState extends State<AccessGpsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'loading');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Necessita GPS para usar esta aplicacao",
            ),
            MaterialButton(
              color: Colors.black,
              elevation: 0,
              shape: StadiumBorder(),
              splashColor: Colors.transparent,
              onPressed: () async {
                final status = await Permission.location.request();
                accessGps(status);
              },
              child: Text(
                "Solicitar Acesso",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void accessGps(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'map');
        break;
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}
