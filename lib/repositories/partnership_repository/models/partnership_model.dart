class PartnershipModel {
  String? message;
  List<PartnershipData>? data;

  PartnershipModel({this.message, this.data});

  PartnershipModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <PartnershipData>[];
      json['data'].forEach((v) {
        data!.add(PartnershipData.fromJson(v));
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

class PartnershipData {
  int? id;
  String? title;
  String? description;
  String? fileUrl;
  String? createdAt;
  String? updatedAt;

  PartnershipData(
      {this.id,
      this.title,
      this.description,
      this.fileUrl,
      this.createdAt,
      this.updatedAt});

  PartnershipData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    fileUrl = json['fileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['fileUrl'] = fileUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}