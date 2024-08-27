// To parse this JSON data, do
//
//     final eventDetailModel = eventDetailModelFromJson(jsonString);

import 'dart:convert';

EventDetailModel eventDetailModelFromJson(String str) => EventDetailModel.fromJson(json.decode(str));

String eventDetailModelToJson(EventDetailModel data) => json.encode(data.toJson());

class EventDetailModel {
    String message;
    Data data;

    EventDetailModel({
        required this.message,
        required this.data,
    });

    factory EventDetailModel.fromJson(Map<String, dynamic> json) => EventDetailModel(
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
    String imageUrl;
    String description;
    String start;
    String end;
    String address;
    DateTime startDate;
    DateTime endDate;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    User user;
    List<User> userJoin;
    bool isJoin;
    bool isExpired;

    Data({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.description,
        required this.start,
        required this.end,
        required this.address,
        required this.startDate,
        required this.endDate,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.user,
        required this.userJoin,
        required this.isJoin,
        required this.isExpired,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        start: json["start"],
        end: json["end"],
        address: json["address"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        user: User.fromJson(json["User"]),
        userJoin: List<User>.from(json["UserJoin"].map((x) => User.fromJson(x))),
        isJoin: json["isJoin"],
        isExpired: json["isExpired"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "description": description,
        "start": start,
        "end": end,
        "address": address,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "UserId": userId,
        "User": user.toJson(),
        "UserJoin": List<dynamic>.from(userJoin.map((x) => x.toJson())),
        "isJoin": isJoin,
        "isExpired": isExpired,
    };
}

class User {
    int id;
    String name;
    String? username;
    String email;
    String phone;
    String password;
    int? otp;
    dynamic fcm;
    DateTime verifiedEmail;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int roleId;
    EventJoin? eventJoin;

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
        this.eventJoin,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        otp: json["otp"],
        fcm: json["fcm"],
        verifiedEmail: DateTime.parse(json["verifiedEmail"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        roleId: json["RoleId"],
        eventJoin: json["EventJoin"] == null ? null : EventJoin.fromJson(json["EventJoin"]),
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
        "EventJoin": eventJoin?.toJson(),
    };
}

class EventJoin {
    int eventId;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;

    EventJoin({
        required this.eventId,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory EventJoin.fromJson(Map<String, dynamic> json) => EventJoin(
        eventId: json["EventId"],
        userId: json["UserId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "EventId": eventId,
        "UserId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
