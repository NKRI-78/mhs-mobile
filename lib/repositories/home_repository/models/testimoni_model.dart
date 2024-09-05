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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['message'] = this.message;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
