// To parse this JSON data, do
//
//     final evenement = evenementFromJson(jsonString);

import 'dart:convert';

Evenement evenementFromJson(String str) => Evenement.fromJson(json.decode(str));

class Evenement {
  Evenement({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.titre,
    this.date,
    this.lieu,
    this.description,
    this.contact,
    this.organisateur_id,
    this.categorie_id,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? titre;
  DateTime? date;
  String? lieu;
  String? description;
  String? contact;
  String? organisateur_id;
  String? categorie_id;

  factory Evenement.fromJson(Map<String, dynamic> json) => Evenement(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    titre: json["titre"],
    lieu: json["lieu"],
    description: json["description"],
    contact: json["contact"],
    organisateur_id: json["organisateur_id"],
    categorie_id: json["categorie_id"],
  );
}