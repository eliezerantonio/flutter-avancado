part of 'helpers.dart';

void calculatingAlert(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Porfavor Aguarde"),
        content: CircularProgressIndicator(),
      ),
    );
  } else {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Porfavor aguarde"),
        content: CupertinoActivityIndicator(),
      ),
    );
  }
}
