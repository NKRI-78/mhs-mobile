class NewsModel {
  int? id;
  String? title;
  String? description;
  String? link;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? userId;
  User? user;

  NewsModel(
      {this.id,
      this.title,
      this.description,
      this.link,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.user});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['imageUrl'] = imageUrl;
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
  String? email;
  String? phone;

  User({this.name, this.username, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
