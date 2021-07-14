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

  Widget _myMessage() {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(this.texto),
      decoration: BoxDecoration(
        color: Color(0xff4d9ef6),
      ),
    );
  }

  Widget _noMyMesssage() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(this.texto),
      decoration: BoxDecoration(
        color: Colors.green[200],
      ),
    );
  }
}
