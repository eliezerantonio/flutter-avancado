import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = new FocusNode();
  bool _estaEscrevendo = false;
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
          Container(
            color: Colors.white,
            height: 50,
            child: _InputChat(),
          ),
        ],
      )),
    );
  }

  Widget _InputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (String texto) {
                    if (texto.trim().length > 0) {
                      setState(() {
                        _estaEscrevendo = true;
                      });
                    } else {
                      setState(() {
                        _estaEscrevendo = false;
                      });
                    }
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: "Enviar mensagem",
                  ),
                  focusNode: _focusNode),
            ),
            //botao enviar

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _estaEscrevendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                      child: Text("Enviar"),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(Icons.send),
                            onPressed: _estaEscrevendo
                                ? () => _handleSubmit(
                                      _textController.text.trim(),
                                    )
                                : null),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    debugPrint(text);

    _textController.clear();

    _focusNode.requestFocus();
    setState(() {
      _estaEscrevendo = false;
    });
  }
}
