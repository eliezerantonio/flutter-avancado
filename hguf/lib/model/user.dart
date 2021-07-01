import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  User();
  String id;
  String email;
  String password;
  String access;

  bool _loading = false;

  get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  User.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        email = map["email"],
        password = map["password"],
        access = map["access"];

  Future<void> login(User user, Function onSuccess, Function onFailed) async {
    try {
      loading = true;
      final result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      onSuccess();

      loading = false;
    } catch (e) {
      onFailed();
    }
  }

  Future<void> save() async {}

  @override
  String toString() {
    return "User{id: $id, email: $email, password: $password, access: $access}";
  }
}
