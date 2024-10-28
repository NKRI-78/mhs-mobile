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
  Parent? parent;
  List<Children>? children;

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
      this.waitingPaymentNewStudent,
      this.parent,
      this.children});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    fcm = json['fcm'] ?? "";
    verifiedEmail = json['verifiedEmail'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    deletedAt = json['deletedAt'] ?? "";
    roleId = json['RoleId'] ?? 0;
    profile = json['Profile'] != null ? Profile.fromJson(json['Profile']) : null;
    role = json['Role'] != null ? Role.fromJson(json['Role']) : null;
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    isWaitingAprovalAdmin = json['isWaitingAprovalAdmin'] ?? false;
    waitingPaymentNewStudent = json['waitingPaymentNewStudent'] != null
    ? WaitingPaymentNewStudent.fromJson(
        json['waitingPaymentNewStudent'])
    : null;
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
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
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
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
  String? paymentFee;
  String? paymentLogo;
  String? paymentUrl;
  String? paymentPlatform;
  String? paymentGuideUrl;
  String? paymentNoVa;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
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
    paymentFee = json['paymentFee'] ?? "";
    paymentLogo = json['paymentLogo'];
    paymentUrl = json['paymentUrl'];
    paymentPlatform = json['paymentPlatform'] ?? "";
    paymentGuideUrl = json['paymentGuideUrl'] ?? "";
    paymentNoVa = json['paymentNoVa'] ?? "";
    amount = json['amount'] ?? 0;
    status = json['status'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    deletedAt = json['deletedAt'] ?? "";
    userId = json['UserId'] ?? 0;
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
  int? schoolGenerationId;
  int? generationRegistrationId;
  SchoolGeneration? schoolGeneration;
  List<AttendanceStudents>? attendanceStudents;
  Testimoni? testimoni;

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
      this.parentId,
      this.schoolGenerationId,
      this.generationRegistrationId,
      this.schoolGeneration,
      this.attendanceStudents,
      this.testimoni});

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
    schoolGenerationId = json['SchoolGenerationId'];
    generationRegistrationId = json['GenerationRegistrationId'];
    schoolGeneration = json['SchoolGeneration'] != null
        ? SchoolGeneration.fromJson(json['SchoolGeneration'])
        : null;
    if (json['AttendanceStudents'] != null) {
      attendanceStudents = <AttendanceStudents>[];
      json['AttendanceStudents'].forEach((v) {
        attendanceStudents!.add(AttendanceStudents.fromJson(v));
      });
    }
    testimoni = json['Testimoni'] != null
        ? Testimoni.fromJson(json['Testimoni'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nisn'] = nisn;
    data['fullname'] = fullname;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['originSchool'] = originSchool;
    data['address'] = address;
    data['phone'] = phone;
    data['parentName'] = parentName;
    data['parentJob'] = parentJob;
    data['parentPhone'] = parentPhone;
    data['programSchool'] = programSchool;
    data['height'] = height;
    data['outfitSize'] = outfitSize;
    data['status'] = status;
    data['statusMessage'] = statusMessage;
    data['photo'] = photo;
    data['classYear'] = classYear;
    data['end'] = end;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    data['ParentId'] = parentId;
    data['SchoolGenerationId'] = schoolGenerationId;
    data['GenerationRegistrationId'] = generationRegistrationId;
    if (schoolGeneration != null) {
      data['SchoolGeneration'] = schoolGeneration!.toJson();
    }
    if (attendanceStudents != null) {
      data['AttendanceStudents'] =
          attendanceStudents!.map((v) => v.toJson()).toList();
    }
    if (testimoni != null) {
      data['Testimoni'] = testimoni!.toJson();
    }
    return data;
  }
}

class SchoolGeneration {
  String? years;
  String? generation;

  SchoolGeneration({this.years, this.generation});

  SchoolGeneration.fromJson(Map<String, dynamic> json) {
    years = json['years'];
    generation = json['generation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['years'] = years;
    data['generation'] = generation;
    return data;
  }
}

class AttendanceStudents {
  int? id;
  String? date;
  int? attendanceId;
  int? studentId;
  String? createdAt;
  String? updatedAt;
  Attendance? attendance;

  AttendanceStudents(
      {this.id,
      this.date,
      this.attendanceId,
      this.studentId,
      this.createdAt,
      this.updatedAt,
      this.attendance});

  AttendanceStudents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    attendanceId = json['attendanceId'];
    studentId = json['studentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    attendance = json['Attendance'] != null
        ? Attendance.fromJson(json['Attendance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['attendanceId'] = attendanceId;
    data['studentId'] = studentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (attendance != null) {
      data['Attendance'] = attendance!.toJson();
    }
    return data;
  }
}

class Attendance {
  String? date;
  String? time;
  String? subject;

  Attendance({this.date, this.time, this.subject});

  Attendance.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['subject'] = subject;
    return data;
  }
}

class Parent {
  int? id;
  String? fullname;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;

  Parent(
      {this.id,
      this.fullname,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fullname'] = fullname;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    return data;
  }
}

class Children {
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
  int? schoolGenerationId;
  int? generationRegistrationId;

  Children(
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
      this.parentId,
      this.schoolGenerationId,
      this.generationRegistrationId});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nisn = json['nisn'];
    fullname = json['fullname'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    originSchool = json['originSchool'];
    address = json['address'];
    phone = json['phone'];
    parentName = json['parentName'];
    parentJob = json['parentJob'];
    parentPhone = json['parentPhone'];
    programSchool = json['programSchool'];
    height = json['height'];
    outfitSize = json['outfitSize'];
    status = json['status'];
    statusMessage = json['statusMessage'];
    photo = json['photo'];
    classYear = json['classYear'];
    end = json['end'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['UserId'];
    parentId = json['ParentId'];
    schoolGenerationId = json['SchoolGenerationId'];
    generationRegistrationId = json['GenerationRegistrationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nisn'] = nisn;
    data['fullname'] = fullname;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['originSchool'] = originSchool;
    data['address'] = address;
    data['phone'] = phone;
    data['parentName'] = parentName;
    data['parentJob'] = parentJob;
    data['parentPhone'] = parentPhone;
    data['programSchool'] = programSchool;
    data['height'] = height;
    data['outfitSize'] = outfitSize;
    data['status'] = status;
    data['statusMessage'] = statusMessage;
    data['photo'] = photo;
    data['classYear'] = classYear;
    data['end'] = end;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    data['ParentId'] = parentId;
    data['SchoolGenerationId'] = schoolGenerationId;
    data['GenerationRegistrationId'] = generationRegistrationId;
    return data;
  }
}

class Testimoni {
  int? id;
  int? rating;
  String? caption;
  String? message;
  String? imageUrl;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? studentId;

  Testimoni(
      {this.id,
      this.rating,
      this.caption,
      this.message,
      this.imageUrl,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.studentId});

  Testimoni.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    caption = json['caption'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
    studentId = json['StudentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['rating'] = rating;
    data['caption'] = caption;
    data['message'] = message;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['UserId'] = userId;
    data['StudentId'] = studentId;
    return data;
  }
}