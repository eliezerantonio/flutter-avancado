// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat_flutter/models/user.dart';

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
    UsersResponse({
        this.ok,
        this.users,
        this.since,
    });

    bool ok;
    List<User> users;
    int since;

    factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        ok: json["ok"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        since: json["since"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "since": since,
    };
}

class UpdateTokenReponse {
  bool ok;
  User user;

  UpdateTokenReponse({this.ok, this.user});

  UpdateTokenReponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}