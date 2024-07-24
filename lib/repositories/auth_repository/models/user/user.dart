class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  int? otp;
  String? fcm;
  String? verifiedEmail;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? roleId;
  bool? authorized;
  Role? role;
  String? token;
  String? refreshToken;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.otp,
      this.fcm,
      this.verifiedEmail,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.roleId,
      this.authorized,
      this.role,
      this.token,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    otp = json['otp'];
    fcm = json['fcm'];
    verifiedEmail = json['verifiedEmail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    roleId = json['RoleId'];
    authorized = json['authorized'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['otp'] = otp;
    data['fcm'] = fcm;
    data['verifiedEmail'] = verifiedEmail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['RoleId'] = roleId;
    data['authorized'] = authorized;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
