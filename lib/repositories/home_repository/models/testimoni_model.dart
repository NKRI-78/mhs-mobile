class TestimoniModel {
  String? message;
  List<TestimoniData>? data;

  TestimoniModel({this.message, this.data});

  TestimoniModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TestimoniData>[];
      json['data'].forEach((v) {
        data!.add(new TestimoniData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestimoniData {
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
  Student? student;

  TestimoniData(
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
      this.studentId,
      this.student});

  TestimoniData.fromJson(Map<String, dynamic> json) {
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
    student =
        json['Student'] != null ? new Student.fromJson(json['Student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['caption'] = this.caption;
    data['message'] = this.message;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['UserId'] = this.userId;
    data['StudentId'] = this.studentId;
    if (this.student != null) {
      data['Student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  String? nisn;
  String? fullname;
  String? gender;
  String? phone;
  int? id;

  Student({this.nisn, this.fullname, this.gender, this.phone, this.id});

  Student.fromJson(Map<String, dynamic> json) {
    nisn = json['nisn'];
    fullname = json['fullname'];
    gender = json['gender'];
    phone = json['phone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nisn'] = this.nisn;
    data['fullname'] = this.fullname;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['id'] = this.id;
    return data;
  }
}
