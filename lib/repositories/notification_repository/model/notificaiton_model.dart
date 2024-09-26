// To parse this JSON data, do
//
//     final notifInformationModel = notifInformationModelFromJson(jsonString);

import 'dart:convert';

NotifInformationModel notifInformationModelFromJson(String str) => NotifInformationModel.fromJson(json.decode(str));

String notifInformationModelToJson(NotifInformationModel data) => json.encode(data.toJson());

class NotifInformationModel {
    String message;
    NotifInformationModelData data;

    NotifInformationModel({
        required this.message,
        required this.data,
    });

    factory NotifInformationModel.fromJson(Map<String, dynamic> json) => NotifInformationModel(
        message: json["message"],
        data: NotifInformationModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class NotifInformationModelData {
    List<NotifData> data;
    int totalItems;
    int totalPages;
    int currentPage;
    dynamic previous;
    int next;

    NotifInformationModelData({
        required this.data,
        required this.totalItems,
        required this.totalPages,
        required this.currentPage,
        required this.previous,
        required this.next,
    });

    factory NotifInformationModelData.fromJson(Map<String, dynamic> json) => NotifInformationModelData(
        data: List<NotifData>.from(json["data"].map((x) => NotifData.fromJson(x))),
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        previous: json["previous"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalItems": totalItems,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "previous": previous,
        "next": next,
    };
}

class NotifData {
    DatumData data;
    int id;
    String type;
    int notifiableId;
    dynamic readAt;
    String createdAt;
    String updatedAt;
    User? user;

    NotifData({
        required this.data,
        this.id = 0,
        required this.type,
        required this.notifiableId,
        required this.readAt,
        this.createdAt = "",
        this.updatedAt = "",
        this.user = null,
    });

    factory NotifData.fromJson(Map<String, dynamic> json) => NotifData(
        data: DatumData.fromJson(json["data"]),
        id: json["id"],
        type: json["type"],
        notifiableId: json["notifiableId"],
        readAt: json["readAt"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        user: User.fromJson(json["User"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "id": id,
        "type": type,
        "notifiableId": notifiableId,
        "readAt": readAt,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "User": user?.toJson(),
    };
}

class DatumData {
    String title;
    String description;

    DatumData({
        required this.title,
        required this.description,
    });

    factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
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
