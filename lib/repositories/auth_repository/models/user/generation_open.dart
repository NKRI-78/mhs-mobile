class GenerationOpenModel {
  String? message;
  GenerationData? data;

  GenerationOpenModel({this.message, this.data});

  GenerationOpenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? GenerationData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GenerationData {
  int? id;
  String? generation;
  String? years;
  String? nameBem;
  int? userBemId;
  String? startRegisterDate;
  String? endRegisterDate;
  String? createdAt;
  String? updatedAt;

  GenerationData(
      {this.id,
      this.generation,
      this.years,
      this.nameBem,
      this.userBemId,
      this.startRegisterDate,
      this.endRegisterDate,
      this.createdAt,
      this.updatedAt});

  GenerationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    generation = json['generation'];
    years = json['years'];
    nameBem = json['nameBem'];
    userBemId = json['userBemId'];
    startRegisterDate = json['startRegisterDate'];
    endRegisterDate = json['endRegisterDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['generation'] = generation;
    data['years'] = years;
    data['nameBem'] = nameBem;
    data['userBemId'] = userBemId;
    data['startRegisterDate'] = startRegisterDate;
    data['endRegisterDate'] = endRegisterDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
