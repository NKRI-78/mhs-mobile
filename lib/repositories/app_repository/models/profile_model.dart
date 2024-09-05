// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

class ProfileModel {
    String message;
    ProfileData data;

    ProfileModel({
        required this.message,
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        data: ProfileData.fromJson(json["data"]),
    );
}

class ProfileData {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? fcm;
  String? verifiedEmail;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? roleId;
  Profile? profile;
  Role? role;
  Student? student;
  bool? isWaitingAprovalAdmin;
  WaitingPaymentNewStudent? waitingPaymentNewStudent;

  ProfileData(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.fcm,
      this.verifiedEmail,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.roleId,
      this.profile,
      this.role,
      this.student,
      this.isWaitingAprovalAdmin,
      this.waitingPaymentNewStudent});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    fcm = json['fcm'] ?? "";
    verifiedEmail = json['verifiedEmail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'] ?? "";
    roleId = json['RoleId'];
    profile = json['Profile'] != null ? Profile.fromJson(json['Profile']) : null;
    role = json['Role'] != null ? Role.fromJson(json['Role']) : null;
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    isWaitingAprovalAdmin = json['isWaitingAprovalAdmin'];
    waitingPaymentNewStudent = json['waitingPaymentNewStudent'] != null
    ? WaitingPaymentNewStudent.fromJson(
        json['waitingPaymentNewStudent'])
    : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name ?? "";
    data['username'] = username ?? "";
    data['email'] = email ?? "";
    data['phone'] = phone ?? "";
    data['fcm'] = fcm ?? "";
    data['verifiedEmail'] = verifiedEmail ?? "";
    data['createdAt'] = createdAt ?? "";
    data['updatedAt'] = updatedAt ?? "";
    data['deletedAt'] = deletedAt ?? "";
    data['RoleId'] = roleId ?? 0;
    if (profile != null) {
      data['Profile'] = profile!.toJson();
    }
    if (role != null) {
      data['Role'] = role!.toJson();
    }
    data['isWaitingAprovalAdmin'] = isWaitingAprovalAdmin;
    if (waitingPaymentNewStudent != null) {
      data['waitingPaymentNewStudent'] =
          waitingPaymentNewStudent!.toJson();
    }
    return data;
  }
}


class Profile {
    int id;
    String fullname;
    String nickname;
    String pictureUrl;
    String city;
    String address;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;

    Profile({
        required this.id,
        required this.fullname,
        required this.nickname,
        required this.pictureUrl,
        required this.city,
        required this.address,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] ?? 0,
        fullname: json["fullname"] ?? "",
        nickname: json["nickname"] ?? "",
        pictureUrl: json["pictureUrl"] ?? "",
        city: json["city"] ?? "",
        address: json["address"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "nickname": nickname,
        "pictureUrl": pictureUrl,
        "city": city,
        "address": address,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "UserId": userId,
    };
}

class WaitingPaymentNewStudent {
  ProfileData? data;
  int? id;
  String? paymentNumber;
  String? paymentMethod;
  String? paymentName;
  String? paymentCode;
  Null paymentFee;
  Null paymentLogo;
  Null paymentUrl;
  String? paymentPlatform;
  Null paymentGuideUrl;
  Null paymentNoVa;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  int? userId;
  PaymentGetOneOrder? paymentGetOneOrder;

  WaitingPaymentNewStudent(
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
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.paymentGetOneOrder});

  WaitingPaymentNewStudent.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
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

class PaymentGetOneOrder {
  int? id;
  String? orderNumber;
  Null noTracking;
  int? amount;
  Null status;
  String? type;
  Null finishAt;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  int? userId;
  int? paymentId;
  Null userShippingAddressId;
  Null storeShippingAddressId;

  PaymentGetOneOrder(
      {this.id,
      this.orderNumber,
      this.noTracking,
      this.amount,
      this.status,
      this.type,
      this.finishAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.paymentId,
      this.userShippingAddressId,
      this.storeShippingAddressId});

  PaymentGetOneOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['orderNumber'];
    noTracking = json['noTracking'];
    amount = json['amount'];
    status = json['status'];
    type = json['type'];
    finishAt = json['finishAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['UserId'];
    paymentId = json['PaymentId'];
    userShippingAddressId = json['userShippingAddressId'];
    storeShippingAddressId = json['storeShippingAddressId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderNumber'] = orderNumber;
    data['noTracking'] = noTracking;
    data['amount'] = amount;
    data['status'] = status;
    data['type'] = type;
    data['finishAt'] = finishAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    data['PaymentId'] = paymentId;
    data['userShippingAddressId'] = userShippingAddressId;
    data['storeShippingAddressId'] = storeShippingAddressId;
    return data;
  }
}

class Role {
    String name;
    String slug;

    Role({
        required this.name,
        required this.slug,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
    };
}

class Student {
  int? id;
  String? nisn;
  String? fullname;
  String? birthDate;
  String? gender;
  String? originSchool;
  String? address;
  String? phone;
  String? parentName;
  String? parentJob;
  String? parentPhone;
  String? programSchool;
  int? height;
  String? outfitSize;
  int? status;
  String? statusMessage;
  String? photo;
  String? classYear;
  String? end;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  int? parentId;

  Student(
      {this.id,
      this.nisn,
      this.fullname,
      this.birthDate,
      this.gender,
      this.originSchool,
      this.address,
      this.phone,
      this.parentName,
      this.parentJob,
      this.parentPhone,
      this.programSchool,
      this.height,
      this.outfitSize,
      this.status,
      this.statusMessage,
      this.photo,
      this.classYear,
      this.end,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.parentId});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nisn = json['nisn'] ?? "-";
    fullname = json['fullname'] ?? "-";
    birthDate = json['birthDate'] ?? "-";
    gender = json['gender'] ?? "";
    originSchool = json['originSchool'] ?? "-";
    address = json['address'] ?? "-";
    phone = json['phone'] ?? "-";
    parentName = json['parentName'] ?? "-";
    parentJob = json['parentJob'] ?? "-";
    parentPhone = json['parentPhone'] ?? "-";
    programSchool = json['programSchool'] ?? "-";
    height = json['height'] ?? 0;
    outfitSize = json['outfitSize'] ?? "-";
    status = json['status'] ?? 0;
    statusMessage = json['statusMessage'] ?? "-";
    photo = json['photo'] ?? "-";
    classYear = json['classYear'] ?? "-";
    end = json['end'] ?? "-";
    createdAt = json['createdAt'] ?? "-";
    updatedAt = json['updatedAt'] ?? "-";
    deletedAt = json['deletedAt'] ?? "-";
    userId = json['UserId'] ?? 0;
    parentId = json['ParentId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nisn'] = this.nisn;
    data['fullname'] = this.fullname;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['originSchool'] = this.originSchool;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['parentName'] = this.parentName;
    data['parentJob'] = this.parentJob;
    data['parentPhone'] = this.parentPhone;
    data['programSchool'] = this.programSchool;
    data['height'] = this.height;
    data['outfitSize'] = this.outfitSize;
    data['status'] = this.status;
    data['statusMessage'] = this.statusMessage;
    data['photo'] = this.photo;
    data['classYear'] = this.classYear;
    data['end'] = this.end;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['UserId'] = this.userId;
    data['ParentId'] = this.parentId;
    return data;
  }
}