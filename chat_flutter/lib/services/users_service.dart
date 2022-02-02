import 'dart:convert';

import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/models/user_response.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class UsersService with ChangeNotifier {
  UsersService() {
    getUsers();
  }

  List<User> allUsers = [];

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse("${Environment.apiUrl}/users"),
          headers: {
            "Content-type": "application/json",
            'x-token': await AuthService.getToken()
          });

      final usersResponse = usersResponseFromJson(response.body);

      allUsers.addAll(usersResponse.users);
      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }

  Future<UpdateTokenReponse> updateNotificationToken(
      String idUser, String token) async {
    try {
      final data = {
        "id": idUser,
        "token": token,
      };

      final response = await http.put(
        Uri.parse("${Environment.apiUrl}/users/updateNotificationToken"),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final updateResponse = UpdateTokenReponse.fromJson(data);

        return updateResponse;
      }
    } catch (e) {
    } finally {}
  }

  //pesquisa
  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<User> get filteredUsers {
    final List<User> filteredUsers = [];
    if (search.isEmpty) {
      filteredUsers.addAll(allUsers);
    } else {
      filteredUsers.addAll(
        allUsers
            .where((p) => p.name.toLowerCase().contains(search.toLowerCase())),
      );
    }
    return filteredUsers;
  }
}
