// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

class Ticket {
  Ticket({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nom,
    this.prix,
    this.description,
    this.dateLimite,
    this.changeDate,
    this.changePrix,
    this.evenement_id,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nom;
  double? prix;
  String? description;
  DateTime? dateLimite;
  DateTime? changeDate;
  double? changePrix;
  String? evenement_id;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    nom: json["nom"],
    prix: json["prix"] == null ? null : double.parse(json["prix"]),
    description: json["description"],
    dateLimite: json["date_limite"] == null ? null : DateTime.parse(json["date_limite"]),
    changeDate: json["change_date"] == null ? null : DateTime.parse(json["change_date"]),
    changePrix: json["change_prix"] == null ? null : double.parse(json["change_prix"]),
    evenement_id: json["evenement_id"],
  );
}