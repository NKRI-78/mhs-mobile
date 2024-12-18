import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/detail_notification_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/transaction_model.dart';

class NotificationRepository {
  String get notif => '${MyApi.baseUrl}/api/v1/notification';
  String get payment => '${MyApi.baseUrl}/api/v1/payment/user';
  String get detailNotif => '${MyApi.baseUrl}/api/v1/broadcast';

  final http = getIt<BaseNetworkClient>();

  Future<PaginationModel<NotifData>> getNotif({int page = 1}) async {
    try {
      final res = await http.get(Uri.parse('$notif?page=$page'));
      

      debugPrint('$notif?page=$page');

     final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var list = (json['data']['data'] as List)
            .map((e) => NotifData.fromJson(e))
            .toList();
        var pagination = Pagination.fromJson(json['data']);
        return PaginationModel<NotifData>(pagination: pagination, list: list);
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      } else {
        throw "Error";
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
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
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<String> readNotif({required int idNotif}) async {
    try {
      final res = await http.put(Uri.parse("$notif/read/$idNotif"));

      debugPrint("Read all : $notif/read/$idNotif");
      if (res.statusCode == 200) {
        return "Berhasil membaca";
      } else {
        throw "error api";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DetailNotifModel> detailNotification({required int id}) async {
    try {
      final res = await http.get(Uri.parse("$detailNotif/$id"));

      debugPrint("Read all : $detailNotif/$id");
      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return DetailNotifModel.fromJson(json);
      } else {
        throw "error api";
      }
    } catch (e) {
      rethrow;
    }
  }
}