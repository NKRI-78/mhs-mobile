class AbsenceCheckInModel {
  String? message;
  Data? data;

  AbsenceCheckInModel({this.message, this.data});

  AbsenceCheckInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Attendance? attendance;
  CheckIn? checkIn;

  Data({this.attendance, this.checkIn});

  Data.fromJson(Map<String, dynamic> json) {
    attendance = json['attendance'] != null
        ? Attendance.fromJson(json['attendance'])
        : null;
    checkIn =
        json['checkIn'] != null ? CheckIn.fromJson(json['checkIn']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attendance != null) {
      data['attendance'] = attendance!.toJson();
    }
    if (checkIn != null) {
      data['checkIn'] = checkIn!.toJson();
    }
    return data;
  }
}

class Attendance {
  int? id;
  String? date;
  String? time;
  String? subject;
  String? token;
  String? createdAt;
  String? updatedAt;

  Attendance(
      {this.id,
      this.date,
      this.time,
      this.subject,
      this.token,
      this.createdAt,
      this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    subject = json['subject'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['time'] = time;
    data['subject'] = subject;
    data['token'] = token;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CheckIn {
  int? id;
  String? date;
  int? attendanceId;
  int? studentId;
  String? createdAt;
  String? updatedAt;

  CheckIn(
      {this.id,
      this.date,
      this.attendanceId,
      this.studentId,
      this.createdAt,
      this.updatedAt});

  CheckIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    attendanceId = json['attendanceId'];
    studentId = json['studentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['attendanceId'] = attendanceId;
    data['studentId'] = studentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
