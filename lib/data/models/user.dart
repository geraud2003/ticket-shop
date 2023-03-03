// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.email,
    this.username,
    this.nom,
    this.prenom
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? role;
  String? email;
  String? username;
  String? nom;
  String? prenom;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    role: json["role"],
    email: json["email"],
    username: json["username"],
    nom: json["nom"],
    prenom: json["prenom"],
  );
}