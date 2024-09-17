// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    String message;
    TransactionModelData data;

    TransactionModel({
        required this.message,
        required this.data,
    });

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        message: json["message"],
        data: TransactionModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class TransactionModelData {
    List<PaymentData> data;
    int totalItems;
    int totalPages;
    int currentPage;
    dynamic previous;
    dynamic next;

    TransactionModelData({
        required this.data,
        required this.totalItems,
        required this.totalPages,
        required this.currentPage,
        required this.previous,
        required this.next,
    });

    factory TransactionModelData.fromJson(Map<String, dynamic> json) => TransactionModelData(
        data: List<PaymentData>.from(json["data"].map((x) => PaymentData.fromJson(x))),
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

class PaymentData {
    Map? data;
  int? id;
  String? paymentNumber;
  String? paymentMethod;
  String? paymentName;
  String? paymentCode;
  String? paymentFee;
  String? paymentLogo;
  String? paymentUrl;
  String? paymentPlatform;
  String? paymentGuideUrl;
  String? paymentNoVa;
  int? amount;
  int? totalAmount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  PaymentGetOneOrder? paymentGetOneOrder;

  PaymentData(
      {this.data,
      this.id,
      this.paymentNumber,
      this.paymentMethod,
      this.paymentName,
      this.paymentCode,
      this.paymentFee,
      this.paymentLogo,
      this.paymentUrl,
      this.paymentPlatform,
      this.paymentGuideUrl,
      this.paymentNoVa,
      this.amount,
      this.totalAmount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.paymentGetOneOrder,
  });

  PaymentData.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    id = json['id'];
    paymentNumber = json['paymentNumber'];
    paymentMethod = json['paymentMethod'];
    paymentName = json['paymentName'];
    paymentCode = json['paymentCode'];
    paymentFee = json['paymentFee'];
    paymentLogo = json['paymentLogo'];
    paymentUrl = json['paymentUrl'];
    paymentPlatform = json['paymentPlatform'];
    paymentGuideUrl = json['paymentGuideUrl'];
    paymentNoVa = json['paymentNoVa'];
    amount = json['amount'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['UserId'];
    paymentGetOneOrder = json['PaymentGetOneOrder'] != null
        ? PaymentGetOneOrder.fromJson(json['PaymentGetOneOrder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['id'] = id;
    data['paymentNumber'] = paymentNumber;
    data['paymentMethod'] = paymentMethod;
    data['paymentName'] = paymentName;
    data['paymentCode'] = paymentCode;
    data['paymentFee'] = paymentFee;
    data['paymentLogo'] = paymentLogo;
    data['paymentUrl'] = paymentUrl;
    data['paymentPlatform'] = paymentPlatform;
    data['paymentGuideUrl'] = paymentGuideUrl;
    data['paymentNoVa'] = paymentNoVa;
    data['amount'] = amount;
    data['totalAmount'] = totalAmount;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    if (paymentGetOneOrder != null) {
      data['PaymentGetOneOrder'] = paymentGetOneOrder!.toJson();
    }
    return data;
  }
}

class DatumData {
    List<Action> actions;
    String paymentType;
    int channelId;

    DatumData({
        required this.actions,
        required this.paymentType,
        required this.channelId,
    });

    factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
        actions: List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        paymentType: json["paymentType"],
        channelId: json["channel_id"],
    );

    Map<String, dynamic> toJson() => {
        "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
        "paymentType": paymentType,
        "channel_id": channelId,
    };
}

class Action {
    String name;
    String method;
    String url;

    Action({
        required this.name,
        required this.method,
        required this.url,
    });

    factory Action.fromJson(Map<String, dynamic> json) => Action(
        name: json["name"],
        method: json["method"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "method": method,
        "url": url,
    };
}

class PaymentGetOneOrder {
    int id;
    String orderNumber;
    dynamic noTracking;
    int amount;
    dynamic status;
    String type;
    dynamic finishAt;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int userId;
    int paymentId;
    dynamic userShippingAddressId;
    dynamic storeShippingAddressId;

    PaymentGetOneOrder({
        required this.id,
        required this.orderNumber,
        required this.noTracking,
        required this.amount,
        required this.status,
        required this.type,
        required this.finishAt,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.userId,
        required this.paymentId,
        required this.userShippingAddressId,
        required this.storeShippingAddressId,
    });

    factory PaymentGetOneOrder.fromJson(Map<String, dynamic> json) => PaymentGetOneOrder(
        id: json["id"],
        orderNumber: json["orderNumber"],
        noTracking: json["noTracking"],
        amount: json["amount"],
        status: json["status"],
        type: json["type"],
        finishAt: json["finishAt"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["UserId"],
        paymentId: json["PaymentId"],
        userShippingAddressId: json["userShippingAddressId"],
        storeShippingAddressId: json["storeShippingAddressId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderNumber": orderNumber,
        "noTracking": noTracking,
        "amount": amount,
        "status": status,
        "type": type,
        "finishAt": finishAt,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "UserId": userId,
        "PaymentId": paymentId,
        "userShippingAddressId": userShippingAddressId,
        "storeShippingAddressId": storeShippingAddressId,
    };
}
