// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String email;
  String phone;
  int status;
  int role;
  DateTime verifiedEmail;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  bool authorized;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.status,
    required this.role,
    required this.verifiedEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.authorized,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        role: json["role"],
        verifiedEmail: DateTime.parse(json["verified_email"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        authorized: json["authorized"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "status": status,
        "role": role,
        "verified_email": verifiedEmail.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "authorized": authorized,
      };
}
