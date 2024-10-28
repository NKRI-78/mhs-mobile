class TestimoniAlumniModel {
  String? message;
  List<TestimoniAlumniData>? data;

  TestimoniAlumniModel({this.message, this.data});

  TestimoniAlumniModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TestimoniAlumniData>[];
      json['data'].forEach((v) {
        data!.add(TestimoniAlumniData.fromJson(v));
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

class TestimoniAlumniData {
  int? id;
  int? rating;
  String? caption;
  String? message;
  String? createdAt;
  String? updatedAt;
  int? userId;
  User? user;

  TestimoniAlumniData(
      {this.id,
      this.rating,
      this.caption,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.user});

  TestimoniAlumniData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    caption = json['caption'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['caption'] = caption;
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['UserId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? username;
  Profile? profile;

  User({this.name, this.username, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    profile =
        json['Profile'] != null ? Profile.fromJson(json['Profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    if (profile != null) {
      data['Profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? fullname;
  String? nickname;
  String? pictureUrl;
  String? city;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? userId;

  Profile(
      {this.id,
      this.fullname,
      this.nickname,
      this.pictureUrl,
      this.city,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.userId});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    nickname = json['nickname'];
    pictureUrl = json['pictureUrl'];
    city = json['city'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['nickname'] = nickname;
    data['pictureUrl'] = pictureUrl;
    data['city'] = city;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['UserId'] = userId;
    return data;
  }
}
