import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/api_url.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/event_repository/models/event_detail_model.dart';
import 'package:mhs_mobile/repositories/event_repository/models/event_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/data_pagination.dart';

class EventRepository {
  String get event => '${MyApi.baseUrl}/api/v1/event';
  String get eventDetail => '${MyApi.baseUrl}/api/v1/event';
  String get jointEventApi => '${MyApi.baseUrl}/event/join';

  final http = getIt<BaseNetworkClient>();

  Future<DataPagination<EventResult>> getEvents() async {
    try {
      final res = await http.get(
        Uri.parse('$event?page=1'),
      );

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return DataPagination(
            list: (json['data']['data'] as List)
                .map((e) => EventResult.fromJson(e))
                .toList(),
            paginate: json['data']['paginate']);
      } else {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<EventDetailModel> getEventDetail(String idEvent) async {
    try {
      final res = await http.get(Uri.parse('$eventDetail/$idEvent'));

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return EventDetailModel.fromJson(json);
      } else {
        throw "error api";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> jointEvent({String idEvent = ""}) async {
    try {
      final res = await http.post(Uri.parse('$event/$idEvent/join'));

      debugPrint(res.body);

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return;
      }
      if (res.statusCode == 400) {
        throw json['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      rethrow;
    }
  }
}