// To parse this JSON data, do
//
//     final categorie = categorieFromJson(jsonString);

import 'dart:convert';

Categorie categorieFromJson(String str) => Categorie.fromJson(json.decode(str));

class Categorie {
  Categorie({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nom,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nom;

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    nom: json["nom"],
  );
}