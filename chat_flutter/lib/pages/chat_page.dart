import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:chat_flutter/widegts/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = new FocusNode();
  bool _estaEscrevendo = false;
  AuthService authService;

  ChatService chatService;
  SocketService socketService;
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    final userTo = chatService.userTo;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                maxRadius: 13,
                child: Text(
                  userTo.name.substring(0, 2),
                  style: TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.blue[100],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                userTo.name,
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
              itemCount: _messages.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            color: Colors.white,
            height: 50,
            child: _inputChat(),
          ),
        ],
      )),
    );
  }

  Widget _inputChat() {
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
                              : null,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    if (text.isEmpty) return;

    _textController.clear();

    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: "123",
      texto: text,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 400,
        ),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscrevendo = false;
    });

    this.socketService.emit('message-personal', {
      'from': this.authService.user.uid,
      'to': this.chatService.userTo.uid,
      'message': text
    });
  }

  @override
  void initState() {
    super.initState();
    this.chatService = Provider.of<ChatService>(context, listen: false);
    this.socketService = Provider.of<SocketService>(context, listen: false);
    this.authService = Provider.of<AuthService>(context, listen: false);
    this.socketService.socket.on("message-personal", _listenMessage);
  }

  void _listenMessage(dynamic payload) {
    ChatMessage message = ChatMessage(
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
      uid: payload["from"],
      texto: payload["message"],
    );

    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    this.socketService.socket.off("message-personal");
  }
}
