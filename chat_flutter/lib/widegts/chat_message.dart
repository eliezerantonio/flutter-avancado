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
      padding: EdgeInsets.all(
        8,
      ),
      margin: EdgeInsets.only(bottom: 7, left: 50, right: 5),
      child: Text(this.texto,
          style: TextStyle(
            color: Colors.white,
          )),
      decoration: BoxDecoration(
          color: Color(0xff4d9ef6), borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _noMyMesssage() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(
        8,
      ),
      margin: EdgeInsets.only(bottom: 7, left: 5, right: 50),
      child: Text(this.texto,
          style: TextStyle(
            color: Colors.black87,
          )),
      decoration: BoxDecoration(
          color: Color(0xffe4e5e8), borderRadius: BorderRadius.circular(20)),
    );
  }
}
