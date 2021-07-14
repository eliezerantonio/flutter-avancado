import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                maxRadius: 12,
                child: Text(
                  "TE",
                  style: TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.blue[100],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Eliezer Antonio',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 1),
      body: Container(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => Text("$i"),
              reverse: true,
            ),
          ),
          Divider(
            height: 1,
          ),
          //TODO:caixa de texto
          Container(color: Colors.white, height: 100)
        ],
      )),
    );
  }
}
