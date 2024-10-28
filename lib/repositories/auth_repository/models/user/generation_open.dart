class GenerationOpenModel {
  String? message;
  Data? data;

  GenerationOpenModel({this.message, this.data});

  GenerationOpenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? startRegisterDate;
  String? endRegisterDate;
  String? closeRegisterDate;
  String? createdAt;
  String? updatedAt;
  int? schoolGenerationId;
  SchoolGeneration? schoolGeneration;

  Data(
      {this.id,
      this.name,
      this.startRegisterDate,
      this.endRegisterDate,
      this.closeRegisterDate,
      this.createdAt,
      this.updatedAt,
      this.schoolGenerationId,
      this.schoolGeneration});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startRegisterDate = json['startRegisterDate'];
    endRegisterDate = json['endRegisterDate'];
    closeRegisterDate = json['closeRegisterDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    schoolGenerationId = json['SchoolGenerationId'];
    schoolGeneration = json['SchoolGeneration'] != null
        ? new SchoolGeneration.fromJson(json['SchoolGeneration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startRegisterDate'] = this.startRegisterDate;
    data['endRegisterDate'] = this.endRegisterDate;
    data['closeRegisterDate'] = this.closeRegisterDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['SchoolGenerationId'] = this.schoolGenerationId;
    if (this.schoolGeneration != null) {
      data['SchoolGeneration'] = this.schoolGeneration!.toJson();
    }
    return data;
  }
}

class SchoolGeneration {
  int? id;
  String? generation;
  String? years;
  String? nameBem;
  int? userBemId;
  String? startRegisterDate;
  String? endRegisterDate;
  String? createdAt;
  String? updatedAt;

  SchoolGeneration(
      {this.id,
      this.generation,
      this.years,
      this.nameBem,
      this.userBemId,
      this.startRegisterDate,
      this.endRegisterDate,
      this.createdAt,
      this.updatedAt});

  SchoolGeneration.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['generation'] = this.generation;
    data['years'] = this.years;
    data['nameBem'] = this.nameBem;
    data['userBemId'] = this.userBemId;
    data['startRegisterDate'] = this.startRegisterDate;
    data['endRegisterDate'] = this.endRegisterDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
