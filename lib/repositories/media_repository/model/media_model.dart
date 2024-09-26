class MediaModel {
  String? message;
  List<MediaData>? data;

  MediaModel({this.message, this.data});

  MediaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MediaData>[];
      json['data'].forEach((v) {
        data!.add(MediaData.fromJson(v));
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

class MediaData {
  int? id;
  String? name;
  String? imgUrl;
  String? linkUrl;
  String? createdAt;
  String? updatedAt;

  MediaData(
      {this.id,
      this.name,
      this.imgUrl,
      this.linkUrl,
      this.createdAt,
      this.updatedAt});

  MediaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgUrl = json['imgUrl'];
    linkUrl = json['linkUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imgUrl'] = imgUrl;
    data['linkUrl'] = linkUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
