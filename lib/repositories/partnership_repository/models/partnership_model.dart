class PartnershipModel {
  String? message;
  List<PartnershipData>? data;

  PartnershipModel({this.message, this.data});

  PartnershipModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <PartnershipData>[];
      json['data'].forEach((v) {
        data!.add(new PartnershipData.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['fileUrl'] = this.fileUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}