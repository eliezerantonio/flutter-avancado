import 'package:chat_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key key,
    @required this.texto,
    @required this.uid,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        child: Container(
          child:
              this.uid == authService.user.uid ? _myMessage() : _noMyMesssage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(right: 5, bottom: 5, left: 50),
            child: Column(
              children: [
                Text(
                  this.texto,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xff060a37),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(height: 4),
        // Text(
        //     createdAt?.toString().substring(0, 16) ??
        //         DateTime.now().toString().substring(0, 16),
        //     style: TextStyle(color: Colors.grey, fontSize: 10))
      ],
    );
  }

  Widget _noMyMesssage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(left: 5, bottom: 5, right: 50),
            child: Text(
              this.texto,
              style: TextStyle(color: Colors.black87),
            ),
            decoration: BoxDecoration(
                color: Color(0xffE4E5E8),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(height: 4),
        // Text(createdAt.toString().substring(0, 16),
        //     style: TextStyle(color: Colors.grey, fontSize: 10))
      ],
    );
  }
}
