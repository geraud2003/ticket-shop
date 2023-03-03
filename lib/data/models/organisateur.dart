// To parse this JSON data, do
//
//     final organisateur = organisateurFromJson(jsonString);

import 'dart:convert';
import 'user.dart';

Organisateur organisateurFromJson(String str) => Organisateur.fromJson(json.decode(str));

class Organisateur {
  Organisateur({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.info_org,
    this.info_exp,
    this.user_id,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? info_org;
  String? info_exp;
  String? user_id;

  factory Organisateur.fromJson(Map<String, dynamic> json) => Organisateur(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    info_exp: json["info_exp"],
    info_org: json["info_org"],
    user_id: json["user_id"],
  );
}