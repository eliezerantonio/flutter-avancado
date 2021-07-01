import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String id;
  String email;
  String password;
  String access;

  User.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        email = map["email"],
        password = map["password"],
        access = map["access"];

  @override
  String toString() {
    return "User{id: $id, email: $email, password: $password, access: $access}";
  }
}
