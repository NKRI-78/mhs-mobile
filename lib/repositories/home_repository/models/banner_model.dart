class BannerModel {
  int? id;
  String? name;
  String? bannerLink;
  String? postLink;
  String? createdAt;
  String? updatedAt;

  BannerModel(
      {this.id,
      this.name,
      this.bannerLink,
      this.postLink,
      this.createdAt,
      this.updatedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bannerLink = json['bannerLink'];
    postLink = json['postLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['bannerLink'] = bannerLink;
    data['postLink'] = postLink;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
