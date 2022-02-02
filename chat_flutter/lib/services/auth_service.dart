import 'dart:convert';
import 'package:chat_flutter/models/register_response.dart';
import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/services/push_notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/login_response.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _loading = false;

  final _storage = new FlutterSecureStorage();

  PushNotificationProvider pushNotificationProvider =
      PushNotificationProvider();
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

  Future login(String email, String password) async {
    try {
      loading = true;
      final data = {
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse("${Environment.apiUrl}/login"),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.body);
        this.user = loginResponse.user;

        await this._saveToken(loginResponse.token);
        pushNotificationProvider.saveToken(user.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
    } finally {
      loading = false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: "token", value: token);
  }

  Future register(String name, String email, String password) async {
    try {
      loading = true;
      final data = {
        "name": name,
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse("${Environment.apiUrl}/login/new"),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final registerResponse = registerResponseFromJson(response.body);
        this.user = registerResponse.user;

        await this._saveToken(registerResponse.token);
        pushNotificationProvider.saveToken(user.uid);
        return true;
      } else {
        final respBody = jsonDecode(response.body);
        print(respBody);
        return respBody["msg"];
      }
    } catch (e) {
    } finally {
      loading = false;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: "token");
    final response = await http
        .get(Uri.parse('${Environment.apiUrl}/login/renew'), headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    print(response.body);

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      this.user = loginResponse.user;

      await this._saveToken(loginResponse.token);
      return true;
    } else {
      this._logout();
      return false;
    }
  }

  Future _logout() async {
    return await _storage.delete(key: "token");
  }
}
