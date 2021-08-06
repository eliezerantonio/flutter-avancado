part of 'helpers.dart';

void calculatingAlert(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Aguarde"),
          content: LinearProgressIndicator() //Text("Calculando rota"),
          ),
    );
  } else {
    // showCupertino()
  }
}
