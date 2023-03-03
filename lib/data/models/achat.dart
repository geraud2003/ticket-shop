// To parse this JSON data, do
//
//     final achat = achatFromJson(jsonString);

import 'dart:convert';

Achat achatFromJson(String str) => Achat.fromJson(json.decode(str));

class Achat {
  Achat({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nombre,
    this.date,
    this.ticketId,
    this.userId,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? nombre;
  DateTime? date;
  String? ticketId;
  String? userId;

  factory Achat.fromJson(Map<String, dynamic> json) => Achat(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    nombre: json["nombre"] == null ? null : int.parse(json['nombre']),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    ticketId: json["ticket_id"],
    userId: json["user_id"],
  );
}