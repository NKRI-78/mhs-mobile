// To parse this JSON data, do
//
//     final messageHomeModel = messageHomeModelFromJson(jsonString);

import 'dart:convert';

MessageHomeModel messageHomeModelFromJson(String str) => MessageHomeModel.fromJson(json.decode(str));

String messageHomeModelToJson(MessageHomeModel data) => json.encode(data.toJson());

class MessageHomeModel {
    String message;
    Data data;

    MessageHomeModel({
        required this.message,
        required this.data,
    });

    factory MessageHomeModel.fromJson(Map<String, dynamic> json) => MessageHomeModel(
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
    String messageHome;
    dynamic roleId;

    Data({
        required this.id,
        required this.messageHome,
        required this.roleId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        messageHome: json["messageHome"],
        roleId: json["RoleId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "messageHome": messageHome,
        "RoleId": roleId,
    };
}
