import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/client.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_channel_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_model.dart';

class PaymentRepository {
  Uri get paymentChannel =>
      Uri.parse('http://157.245.193.49:3098/api/v1/channel');

  Uri findPaymentUri(String id) =>
      Uri.parse('${MyApi.baseUrl}/api/v1/payment/$id');

  Future<PaymentModel> findPayment(String paymentNumber) async {
    try {
      var res = await MyClient().get(findPaymentUri(paymentNumber));

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return PaymentModel.fromJson(json['data']);
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PaymentChannelModel>> getChannels() async {
    try {
      var res = await MyClient().get(paymentChannel);

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list = (json['data'] as List)
            .map((e) => PaymentChannelModel.fromJson(e))
            .toList();
        return list;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }
}
