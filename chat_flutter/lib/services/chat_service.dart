import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/message.dart';
import 'package:chat_flutter/models/messages_response.dart';
import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  User userTo = User();

  Future<List<Message>> getMessagea(String userID) async {
    final response = await http.get('${Environment.apiUrl}/messages/$userID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

    final messagesResponse = messagesResponseFromJson(response.body);

    return messagesResponse.messages;
  }
}
