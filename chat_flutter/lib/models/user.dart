// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.online,
    this.name,
    this.notificationToken,
    this.email,
    this.uid,
  });

  bool online;
  String name;
  String email;
  String notificationToken;
  String uid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        online: json["online"],
        name: json["name"],
        notificationToken: json['notification_token'],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "name": name,
        "notification_token": notificationToken,
        "email": email,
        "uid": uid,
      };
}
