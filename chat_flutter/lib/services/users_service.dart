import 'package:chat_flutter/globals/environment.dart';
import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/models/user_response.dart';
import 'package:chat_flutter/services/auth_service.dart';

import 'package:http/http.dart' as http;

class UsersService {
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse("${Environment.apiUrl}/users"),
          headers: {
            "Content-type": "application/json",
            'x-token': await AuthService.getToken()
          });

      final usersResponse = usersResponseFromJson(response.body);
      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
