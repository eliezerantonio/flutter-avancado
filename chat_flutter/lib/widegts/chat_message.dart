import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;

  const ChatMessage({Key key, this.texto, this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == "123" ? _myMessage() : _noMyMesssage(),
    );
  }
}

Widget _myMessage() {
  return Container();
}

Widget _noMyMesssage() {
  return Container();
}
