import 'dart:convert';

import 'package:chat_flutter/globals/environment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
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

    print(response);
  }
}
