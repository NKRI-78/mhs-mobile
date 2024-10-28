class GradeStudentReportModel {
  String? message;
  List<GradeStudentReportData>? data;

  GradeStudentReportModel({this.message, this.data});

  GradeStudentReportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GradeStudentReportData>[];
      json['data'].forEach((v) {
        data!.add(GradeStudentReportData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GradeStudentReportData {
  int? id;
  String? fullname;
  String? nisn;
  User? user;
  GradeStudent? gradeStudent;

  GradeStudentReportData({this.id, this.fullname, this.nisn, this.user, this.gradeStudent});

  GradeStudentReportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    nisn = json['nisn'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    gradeStudent = json['GradeStudent'] != null
        ? GradeStudent.fromJson(json['GradeStudent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['nisn'] = nisn;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    if (gradeStudent != null) {
      data['GradeStudent'] = gradeStudent!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  Profile? profile;

  User({this.id, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile =
        json['Profile'] != null ? Profile.fromJson(json['Profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (profile != null) {
      data['Profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? pictureUrl;

  Profile({this.pictureUrl});

  Profile.fromJson(Map<String, dynamic> json) {
    pictureUrl = json['pictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pictureUrl'] = pictureUrl;
    return data;
  }
}

class GradeStudent {
  int? id;
  int? a;
  int? p;
  int? uts;
  int? uas;
  int? total;
  int? studentId;
  String? createdAt;
  String? updatedAt;

  GradeStudent(
      {this.id,
      this.a,
      this.p,
      this.uts,
      this.uas,
      this.total,
      this.studentId,
      this.createdAt,
      this.updatedAt});

  GradeStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    a = json['a'];
    p = json['p'];
    uts = json['uts'];
    uas = json['uas'];
    total = json['total'];
    studentId = json['studentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['a'] = a;
    data['p'] = p;
    data['uts'] = uts;
    data['uas'] = uas;
    data['total'] = total;
    data['studentId'] = studentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
