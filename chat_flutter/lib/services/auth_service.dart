import 'dart:convert';
import 'package:chat_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/login_response.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _loading = false;

  final _storage = new FlutterSecureStorage();
  get loading => this._loading;

  set loading(value) {
    this._loading = value;

    notifyListeners();
  }

  //Getters de toekn de form static

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: "token");

    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: "token");
  }

  Future<bool> login(String email, String password) async {
    try {
      loading = true;
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
      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.body);
        this.user = loginResponse.user;

        await this._saveToken(loginResponse.token);
        return true;

        //TODO:  guardar token no celular
      } else {
        return false;
      }
    } catch (e) {} finally {
      loading = false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: "token", value: token);
  }

  Future<bool> _register(String name,String email, String password) async {

      try {
      loading = true;
      final data = {
        "name":name,
        "email": email,
        "password": password,
      };

      final response = await http.post(
        "${Environment.apiUrl}/login/new",
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.body);
        this.user = loginResponse.user;

        await this._saveToken(loginResponse.token);
        return true;

        //TODO:  guardar token no celular
      } else {
        return false;
      }
    } catch (e) {} finally {
      loading = false;
    }

  }

  Future _logout(String token) async {
    return await _storage.delete(key: "token");
  }
}
