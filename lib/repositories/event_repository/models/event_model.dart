// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
    String message;
    Data data;

    EventModel({
        required this.message,
        required this.data,
    });

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<EventResult> data;
    int totalItems;
    int totalPages;
    int currentPage;
    dynamic previous;
    dynamic next;

    Data({
        required this.data,
        required this.totalItems,
        required this.totalPages,
        required this.currentPage,
        required this.previous,
        required this.next,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<EventResult>.from(json["data"].map((x) => EventResult.fromJson(x))),
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

class EventResult {
    int id;
    String title;
    String imageUrl;
    String description;
    String start;
    String end;
    String address;
    String startDate;
    String endDate;
    String createdAt;
    String updatedAt;
    int userId;
    User user;
    List<User> userJoin;
    bool isJoin;
    bool isExpired;

    EventResult({
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

    factory EventResult.fromJson(Map<String, dynamic> json) => EventResult(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        start: json["start"],
        end: json["end"],
        address: json["address"],
        startDate: json["startDate"] ?? "",
        endDate: json["endDate"] ?? "",
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
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
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
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
