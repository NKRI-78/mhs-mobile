class DocumenModel {
  String? message;
  List<DocumentData>? data;

  DocumenModel({this.message, this.data});

  DocumenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DocumentData>[];
      json['data'].forEach((v) {
        data!.add(DocumentData.fromJson(v));
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

class DocumentData {
  int? id;
  String? title;
  String? type;
  String? uploadDate;
  String? fileUrl;
  String? description;
  String? createdAt;
  String? updatedAt;

  DocumentData(
      {this.id,
      this.title,
      this.type,
      this.uploadDate,
      this.fileUrl,
      this.description,
      this.createdAt,
      this.updatedAt});

  DocumentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    uploadDate = json['uploadDate'];
    fileUrl = json['fileUrl'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['uploadDate'] = uploadDate;
    data['fileUrl'] = fileUrl;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
