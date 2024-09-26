class TestimoniModel {
  String? message;
  List<TestimoniData>? data;

  TestimoniModel({this.message, this.data});

  TestimoniModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TestimoniData>[];
      json['data'].forEach((v) {
        data!.add(TestimoniData.fromJson(v));
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

class TestimoniData {
  int? id;
  String? caption;
  String? message;
  String? imageUrl;
  String? name;
  String? createdAt;
  String? updatedAt;

  TestimoniData(
      {this.id,
      this.caption,
      this.message,
      this.imageUrl,
      this.name,
      this.createdAt,
      this.updatedAt});

  TestimoniData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['message'] = message;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
