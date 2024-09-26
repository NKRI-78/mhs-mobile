import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/transaction_model.dart';

class NotificationRepository {
  String get notif => '${MyApi.baseUrl}/api/v1/notification';
  String get payment => '${MyApi.baseUrl}/api/v1/payment/user';

  final http = getIt<BaseNetworkClient>();

  Future<PaginationModel<NotifData>> getNotif() async {
    try {
      final res = await http.get(Uri.parse(notif));

      // debugPrint(res.body);

     final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var listdata = json['data']['data'];
        debugPrint("List data notif : $listdata");
        var pagination = Pagination.fromJson(json['data']);
        var list = (json['data']['data'] as List)
            .map((e) => NotifData.fromJson(e))
            .toList();
        return PaginationModel<NotifData>(pagination: pagination, list: list);
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
  Future<PaginationModel<PaymentData>> getTransaction() async {
    try {
      final res = await http.get(Uri.parse(payment));

      // debugPrint(res.body);

     final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var listdata = json['data']['data'];
        debugPrint("List data notif transaksi : $listdata");
        var pagination = Pagination.fromJson(json['data']);
        var list = (json['data']['data'] as List)
            .map((e) => PaymentData.fromJson(e))
            .toList();
        return PaginationModel<PaymentData>(pagination: pagination, list: list);
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