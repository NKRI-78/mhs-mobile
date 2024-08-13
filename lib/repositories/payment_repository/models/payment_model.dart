class PaymentModel {
  Map? data;
  int? id;
  String? paymentNumber;
  String? paymentMethod;
  String? paymentName;
  String? paymentCode;
  String? paymentFee;
  String? paymentLogo;
  String? paymentUrl;
  String? paymentPlatform;
  String? paymentGuideUrl;
  String? paymentNoVa;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;

  PaymentModel(
      {this.data,
      this.id,
      this.paymentNumber,
      this.paymentMethod,
      this.paymentName,
      this.paymentCode,
      this.paymentFee,
      this.paymentLogo,
      this.paymentUrl,
      this.paymentPlatform,
      this.paymentGuideUrl,
      this.paymentNoVa,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    id = json['id'];
    paymentNumber = json['paymentNumber'];
    paymentMethod = json['paymentMethod'];
    paymentName = json['paymentName'];
    paymentCode = json['paymentCode'];
    paymentFee = json['paymentFee'];
    paymentLogo = json['paymentLogo'];
    paymentUrl = json['paymentUrl'];
    paymentPlatform = json['paymentPlatform'];
    paymentGuideUrl = json['paymentGuideUrl'];
    paymentNoVa = json['paymentNoVa'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['id'] = id;
    data['paymentNumber'] = paymentNumber;
    data['paymentMethod'] = paymentMethod;
    data['paymentName'] = paymentName;
    data['paymentCode'] = paymentCode;
    data['paymentFee'] = paymentFee;
    data['paymentLogo'] = paymentLogo;
    data['paymentUrl'] = paymentUrl;
    data['paymentPlatform'] = paymentPlatform;
    data['paymentGuideUrl'] = paymentGuideUrl;
    data['paymentNoVa'] = paymentNoVa;
    data['amount'] = amount;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['UserId'] = userId;
    return data;
  }
}
