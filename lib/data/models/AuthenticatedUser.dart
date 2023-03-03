// To parse this JSON data, do
//
//     final authenticatedUser = authenticatedUserFromJson(jsonString);

import 'dart:convert';
import 'user.dart';


AuthenticatedUser authenticatedUserFromJson(String str) => AuthenticatedUser.fromJson(json.decode(str));

class AuthenticatedUser {
  AuthenticatedUser({
    this.accessToken,
    this.user,
  });

  String? accessToken;
  User? user;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => AuthenticatedUser(
    accessToken: json["access_token"] == null ? null : json["access_token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );
}
