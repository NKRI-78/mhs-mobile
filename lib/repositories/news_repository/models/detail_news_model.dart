// To parse this JSON data, do
//
//     final detailNewsModel = detailNewsModelFromJson(jsonString);

import 'dart:convert';

DetailNewsModel detailNewsModelFromJson(String str) => DetailNewsModel.fromJson(json.decode(str));

String detailNewsModelToJson(DetailNewsModel data) => json.encode(data.toJson());

class DetailNewsModel {
    String message;
    Data data;

    DetailNewsModel({
        required this.message,
        required this.data,
    });

    factory DetailNewsModel.fromJson(Map<String, dynamic> json) => DetailNewsModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String title;
    String description;
    String link;
    String imageUrl;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    User user;

    Data({
        required this.id,
        required this.title,
        required this.description,
        required this.link,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        link: json["link"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        user: User.fromJson(json["User"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "link": link,
        "imageUrl": imageUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "UserId": userId,
        "User": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String username;
    String email;
    String phone;
    String password;
    int otp;
    String fcm;
    DateTime verifiedEmail;
    DateTime createdAt;
    DateTime updatedAt;
    String deletedAt;
    int roleId;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
        required this.otp,
        required this.fcm,
        required this.verifiedEmail,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.roleId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        password: json["password"] ?? "",
        otp: json["otp"] ?? 0,
        fcm: json["fcm"] ?? "",
        verifiedEmail: DateTime.parse(json["verifiedEmail"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"] ?? "",
        roleId: json["RoleId"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "otp": otp,
        "fcm": fcm,
        "verifiedEmail": verifiedEmail.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "RoleId": roleId,
    };
}
