import 'dart:convert';
import 'package:chat_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/login_response.dart';

class AuthService with ChangeNotifier {
  User user;
  Future login(String email, String password) async {
    final data = {
      "email": email,
      "password": password,
    };

    final response = await http.post(
      "${Environment.apiUrl}/login",
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 20) {
      final loginResponse = loginResponseFromJson(response.body);
      this.user = loginResponse.user;
    }
    print(response.body);
  }
}
